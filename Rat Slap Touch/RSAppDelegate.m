//
//  RSAppDelegate.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSAppDelegate.h"
#import "RSNetworkController.h"
#import "RSStatusUpdate.h"
#import "RSViewController.h"

@implementation RSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"Delegate: Initializing");
    viewController = nil;
    gameType = NO_CURRENT_GAME;
    networkClient = [[RSNetworkController alloc] init];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    if([networkClient isConnected]) {
        [networkClient forceDisconnect];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    if(![networkClient isConnected]) {
        [networkClient connectToHost];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    if([networkClient isConnected]) {
        [networkClient forceDisconnect];
    }
}

- (int) isInGameType {
    return gameType;
}

- (void) resumeGame {
    NSLog(@"Delegate: Resuming Game");
}

- (void) abandonGame {
    NSLog(@"Delegate: Abandoning Game");
    gameType = NO_CURRENT_GAME;
}

- (void) joinGame:(int) newGameType {
    NSLog(@"Delegate: We're joining a new game now");
    gameType = newGameType;
}

- (void) processDisconnect {
    NSLog(@"Delegate: We have been disconnected from the server");
    gameType = NO_CURRENT_GAME;
}

- (void) processServerStatistics:(RSStatusUpdate *) newStats {
    NSLog(@"Delegate: Updating View with new Statistics");
    if(viewController) {
        [viewController updateServerStatistics:newStats];
    }    
}

- (void) assignViewController:(RSViewController *) newViewController {
    viewController = newViewController;
}


@end
