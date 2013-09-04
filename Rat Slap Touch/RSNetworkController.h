//
//  RSNetworkContorller.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSAppDelegate;
@class GCDAsyncSocket;

#define SERVER_STATUS_TAG 1

@interface RSNetworkController : NSObject {
    RSAppDelegate *appDelegate;
    GCDAsyncSocket *remoteClient;
    NSMutableData *oldData;
    BOOL canTransmit;
}

- (BOOL) isConnected;
- (BOOL) connectToHost;
- (void) forceDisconnect;
- (void) requestServerStatistics;
- (void) joinGame:(int) players;
- (void) assignNickname:(NSString *) newNickname;

@end
