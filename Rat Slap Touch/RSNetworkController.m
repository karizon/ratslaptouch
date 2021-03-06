//
//  RSNetworkContorller.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSNetworkController.h"
#import "RSAppDelegate.h"
#import "RSStatusUpdate.h"
#import "RSGameUpdate.h"
#import "RSRoundUpdate.h"
#import "RSVisibleCard.h"

#import "GCDAsyncSocket.h"

@implementation RSNetworkController

- (id) init {
    self = [super init];
    if(self) {
        appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
        canTransmit = NO;
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

- (BOOL) isConnected {
    if(remoteClient && canTransmit)
        return TRUE;
    
    return FALSE;
}

- (void) gracefulDisconnect {
    if(remoteClient && canTransmit) {
        NSLog(@"Gracefully logging out of game server");
        // Let's send a graceful game exit first

        [remoteClient disconnectAfterWriting];
        remoteClient = nil;
        canTransmit = NO;
    } else {
        [self forceDisconnect];
    }

}

- (void) forceDisconnect {
    if(remoteClient) {
        NSLog(@"Network: Forcing connection drop");
        [remoteClient disconnect];
        remoteClient = nil;
        canTransmit = NO;
    }
}

- (void) transmitJSON: (NSDictionary *) jsonDictionary {
    if(jsonDictionary) {
        NSError *error;

        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:0 error:&error];
        NSString *resultAsString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"Network: Sending %@",resultAsString);
        [remoteClient writeData:jsonData withTimeout:-1 tag:SERVER_STATUS_TAG];
    }
}

- (void) playCard: (BOOL) stack {
    if(remoteClient && canTransmit) {
        NSString *type = @"stack";
        if(!stack)
            type = @"slap";
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"CARD", @"type",
                                        type, @"status",
                                        nil];
        [self transmitJSON:jsonDictionary];
    }
}

- (void) joinGame:(int) players {
    if(remoteClient && canTransmit) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"JOIN", @"type",
                                        @"REQUEST", @"status",
                                        [NSString stringWithFormat:@"%d",players],@"players",
                                        nil];
        [self transmitJSON:jsonDictionary];
    }
}

- (void) leaveGame {
    if(remoteClient && canTransmit) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"LEAVE", @"type",
                                        @"REQUEST", @"status",
                                        nil];
        [self transmitJSON:jsonDictionary];
    }
}

- (void) assignNickname:(NSString *)newNickname {
    if(remoteClient && newNickname && canTransmit) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"NICKNAME", @"type",
                                        newNickname,@"nickname",
                                        nil];
        [self transmitJSON:jsonDictionary];
    }
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
    [appDelegate processConnect];
    canTransmit = YES;
    [appDelegate assignNickname];
}

#pragma mark Main Processing Loop Here

- (void) handleJSONBlock:(NSDictionary *) JSONBlock {
    NSString* dataType = [JSONBlock valueForKey:@"type"];
    if([dataType isEqualToString:@"HELO"]) {
        // NSLog(@"Network: Successfully received HELO string");
    } else if([dataType isEqualToString:@"GAME"]) {
        // NSLog(@"Network: Received Game Update");
        if([[JSONBlock valueForKey:@"status"] isEqualToString:@"ENDED"]) {
            if([[JSONBlock valueForKey:@"winner"] integerValue]) {
                [appDelegate gameEnded:YES];
            } else {
                [appDelegate gameEnded:NO];
            }
        } else {
            NSMutableArray *playerNames = [NSMutableArray array];
            NSArray *nameArray = [JSONBlock objectForKey:@"playerNames"];
            for(NSDictionary *nameBlock in nameArray) {
                [playerNames addObject:[nameBlock valueForKey:@"name"]];
            }
            
            [appDelegate processGameUpdate:[[RSGameUpdate alloc]
                                            initWithPlayers:[[JSONBlock
                                                              valueForKey:@"playerCount"] integerValue]
                                            newGameSize:[[JSONBlock valueForKey:@"gameSize"] integerValue]
                                            gameID:[[JSONBlock valueForKey:@"gameID"] integerValue]
                                            status:[JSONBlock valueForKey:@"status"]
                                            position:[[JSONBlock valueForKey:@"position"] integerValue]
                                            playerNames:playerNames]];
        }
    } else if([dataType isEqualToString:@"STATISTICS"]) {
        if([[JSONBlock valueForKey:@"status"] isEqualToString:@"SUCCESS"]) {
            [self processStatistics:JSONBlock];
        }
    } else if([dataType isEqualToString:@"ROUND"]) {
        NSMutableArray *cardStacks = [NSMutableArray array];
        NSArray *stackArray = [JSONBlock objectForKey:@"handSizes"];
        for(NSDictionary *nameBlock in stackArray) {
            [cardStacks addObject:[NSNumber numberWithInt:[[nameBlock valueForKey:@"size"] integerValue]]];
        }
        RSRoundUpdate *update = [[RSRoundUpdate alloc] initWithHandSizes:cardStacks
                                                               whoseMove:[[JSONBlock valueForKey:@"currentPlayer"]
                                                                          integerValue]];
        [appDelegate processRoundUpdate:update];
    } else if([dataType isEqualToString:@"CARD"]) {
        char newSuit=0;
        if([[JSONBlock valueForKey:@"suit"] isEqualToString:@"heart"]) {
            newSuit = SUIT_HEART;
        } else if([[JSONBlock valueForKey:@"suit"] isEqualToString:@"diamond"]) {
            newSuit = SUIT_DIAMOND;
        } else if([[JSONBlock valueForKey:@"suit"] isEqualToString:@"spade"]) {
            newSuit = SUIT_SPADE;
        } else if([[JSONBlock valueForKey:@"suit"] isEqualToString:@"club"]) {
            newSuit = SUIT_CLUB;
        }
        RSVisibleCard *card = [[RSVisibleCard alloc]initShowingWithFace:[JSONBlock valueForKey:@"face"]
                                                                   suit:newSuit
                                                               cardSize:CGRectMake(0, 0, 0, 0)];
        [appDelegate addCardToPlayed:card];
        
    }
}

- (void)processServerData:(NSData *)data {
    
    int totalParsedDistance = 0;
    
    NSData *curData = data;
    if(oldData) {
        if(data) {
            [oldData appendData:data];
        }
        curData = oldData;
    }
    
    NSError *jsonParsingError = nil;
    NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:curData
                                                                   options:0
                                                                     error:&jsonParsingError];
    NSString *textData = [[NSString alloc] initWithData:curData encoding:NSUTF8StringEncoding];
    if(![textData isEqualToString:@"\n"]) {
        NSRange range = [textData rangeOfString:@"}"];
        if(range.location == NSNotFound) {
            // No closing brace found.  Definitely No complete JSON here.  Append and move on
            if(!oldData) {
                oldData = [[NSMutableData alloc] initWithData:data];
            }
        } else {
            NSString *localData = textData;
            while(range.location != NSNotFound) {
                // We have a closing brace, let's see if we can parse that data;
                totalParsedDistance += range.location;
                //NSLog(@"JSON: Total Distance to test is currently %d",totalParsedDistance);
                NSString *testString = [textData substringToIndex:totalParsedDistance + 1];
                NSData *newData = [testString dataUsingEncoding:NSUTF8StringEncoding];
                //NSLog(@"JSON: Testing: %@",testString);
                NSError *localParsingError = nil;
                serverResponse = [NSJSONSerialization JSONObjectWithData:newData
                                                                 options:0
                                                                   error:&localParsingError];
                if(localParsingError) {
                    // Not enough data in processed chunk, see if we can find another brace
                    localData = [localData substringFromIndex:range.location+1];
                    range = [localData rangeOfString:@"}"];
                    // Add in the offset for the extra } we had to skip
                    totalParsedDistance += 1;
                } else {
                    NSLog(@"Network: Successfully Parsed %@",testString);
                    [self handleJSONBlock:serverResponse];
                    // Purge the string we just processed out of the buffer
                    oldData = [[NSMutableData alloc] init];
                    [oldData appendData:[[textData substringFromIndex:totalParsedDistance+1]
                                         dataUsingEncoding:NSUTF8StringEncoding]];
                    // Then see if we can process any more data by calling ourselves and then exiting
                    [self processServerData:nil];
                    return;
                }
            }
            // NSLog(@"Network: Not enough Data in buffer, waiting for more data");
        }
    } else {
        oldData = nil;
    }
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    // NSLog(@"Network: Received %@",[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
    [self processServerData:data];
    [remoteClient readDataWithTimeout:-1.0 tag:0];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
	NSLog(@"Network: socketDidDisconnect:%p withError: %@", sock, err);
    remoteClient = nil;
    [appDelegate processDisconnect];
}

#pragma mark Statistics Processing:

- (void) processStatistics: (NSDictionary *) statsDict {
    NSNumber *clients = [statsDict valueForKey:@"clients"];
    NSNumber *games = [statsDict valueForKey:@"games"];
    NSNumber *twoWaiting = [statsDict valueForKey:@"twowaiting"];
    NSNumber *fourWaiting =[statsDict valueForKey:@"fourwaiting"];
    
    RSStatusUpdate *stats = [[RSStatusUpdate alloc] initWithClients:[clients intValue]
                                                              games:[games intValue]
                                                         twoWaiting:[twoWaiting intValue]
                                                        fourWaiting:[fourWaiting intValue]];
    [appDelegate processServerStatistics:stats];
}
@end
