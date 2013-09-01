//
//  RSGCHelper.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/30/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGCHelper.h"


@implementation RSGCHelper

@synthesize gameCenterAvailable;

static RSGCHelper *sharedHelper = nil;

+ (RSGCHelper *) sharedInstance {
    if(!sharedHelper) {
        sharedHelper = [[RSGCHelper alloc] init];
    }
    return sharedHelper;
}

- (BOOL) isGameCenterAvailable {
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
    
}

- (id) init {
    self = [super init];
    if(self) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if(gameCenterAvailable) {
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            [nc addObserver:self
                   selector:@selector(authenticationChanged)
                       name:GKPlayerAuthenticationDidChangeNotificationName
                     object:nil];
        }
    }
    
    return self;
}

- (void) authenticationChanged {
    if([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated) {
        NSLog(@"GameCenter: Authentication Changed - player authenticated");
        userAuthenticated = YES;
    } else if(![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
        NSLog(@"GameCenter: Authentication Changed - player not authenticated");
        userAuthenticated = NO;
    }
}

- (void)authenticateLocalUser {
    
    if (!gameCenterAvailable) return;
    
    NSLog(@"Authenticating local user...");
    [GKLocalPlayer localPlayer].authenticateHandler = ^(UIViewController *viewController,NSError *error) {
        if ([GKLocalPlayer localPlayer].authenticated) {
            //already authenticated
        } else if(viewController) {
            UIViewController *presentingController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            [presentingController presentViewController:viewController animated:NO completion:nil];//present the login form
        } else {
            //problem with authentication,probably bc the user doesn't use Game Center
        }
    };
}

@end
