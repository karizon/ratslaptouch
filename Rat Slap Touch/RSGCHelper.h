//
//  RSGCHelper.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/30/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@class RSAppDelegate;

@interface RSGCHelper : NSObject {
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
    RSAppDelegate *appDelegate;
}

@property (assign, readonly) BOOL gameCenterAvailable;

+ (RSGCHelper *) sharedInstance;
- (void) authenticateLocalUser;
- (void) assignDelegate:(RSAppDelegate *) delegate;

@end
