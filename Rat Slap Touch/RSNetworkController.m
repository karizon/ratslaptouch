//
//  RSNetworkContorller.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSNetworkController.h"
#import "RSAppDelegate.h"
#import "GCDAsyncSocket.h"

@implementation RSNetworkController

- (id) init {
    self = [super init];
    if(self) {
        appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
        if(![self connectToHost]) {
            return nil;
        }
    }
    return self;
}

- (BOOL) connectToHost {
    NSString *host = @"ttl.mandrake.net";
    uint16_t port = 31337;
    NSLog(@"Network: Connecting to \"%@\" on port %hu...", host, port);
    
    NSError *error = nil;
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    remoteClient = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    if (![remoteClient connectToHost:host onPort:port error:&error]) {
        NSLog(@"Network: Error connecting: %@", error);
        remoteClient = nil;
        return NO;
    }
    
    return YES;
}


#pragma mark socket communications
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
	
    NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [settings setObject:@"ttl.mandrake.net"
                 forKey:(NSString *)kCFStreamSSLPeerName];
    
    // Allow self-signed certificates
    [settings setObject:[NSNumber numberWithBool:YES]
                 forKey:(NSString *)kCFStreamSSLAllowsAnyRoot];
    
    [sock startTLS:settings];
    
    [remoteClient readDataToData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1.0 tag:0];
}

- (void)socketDidSecure:(GCDAsyncSocket *)sock{
	NSLog(@"Network: TLS Encryped Session Established");
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
	NSLog(@"Network: Data written successfully for tag:%ld", tag);
}


#pragma mark Main Processing Loop Here

- (void)processServerData:(NSData *)data {
    NSData *curData = data;
    if(oldData) {
        [oldData appendData:data];
        curData = oldData;
    }
    NSError *jsonParsingError = nil;
    NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:curData options:0 error:&jsonParsingError];
    if(jsonParsingError) {
        if(![[[NSString alloc] initWithData:curData encoding:NSUTF8StringEncoding] isEqualToString:@"\n"]) {
            NSLog(@"Network: Incomplete JSON, chunking into bucket for next packet");
            if(!oldData) {
                oldData = [[NSMutableData alloc] initWithData:data];
            }
        }
    } else {
        /* NSEnumerator *enumKey = [serverResponse keyEnumerator];
         id key;
         while((key = [enumKey nextObject])) {
         NSLog(@"JSON: %@: %@",key, [serverResponse objectForKey:key]);
         } */
        
        NSString* dataType = [serverResponse valueForKey:@"type"];
        if([dataType isEqualToString:@"HELO"]) {
            NSLog(@"Network: Successfully received HELO string, requesting current statistics");
        } else if([dataType isEqualToString:@"STATISTICS"]) {
            if([[serverResponse valueForKey:@"status"] isEqualToString:@"SUCCESS"]) {
            }
        }
        oldData = nil;
    }
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"Network: Received %@",[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
    [self processServerData:data];
    [remoteClient readDataWithTimeout:-1.0 tag:0];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
	NSLog(@"Network: socketDidDisconnect:%p withError: %@", sock, err);
    remoteClient = nil;
    // [appDelegate processLogout];
}

- (BOOL) isConnected {
    if(remoteClient)
        return TRUE;
    
    return FALSE;
}


@end
