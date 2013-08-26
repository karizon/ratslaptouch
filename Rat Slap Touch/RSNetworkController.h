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

@interface RSNetworkController : NSObject {
    RSAppDelegate *appDelegate;
    GCDAsyncSocket *remoteClient;
    NSMutableData *oldData;

}

@end
