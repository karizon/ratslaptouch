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
#import "RSGameUpdate.h"
#import "RSViewController.h"
#import "RSGCHelper.h"
#import "RSGameViewController.h"

@implementation RSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"Delegate: Initializing");
    viewController = nil;
    gameType = NO_CURRENT_GAME;
    networkClient = [[RSNetworkController alloc] init];
    
    gameCenter = [RSGCHelper sharedInstance];
    [gameCenter assignDelegate:self];
    [gameCenter authenticateLocalUser];
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
    NSLog(@"Delegate: We're joining a new game now for %d players",newGameType);
    [networkClient joinGame:newGameType];
    gameType = newGameType;
}

- (void) processDisconnect {
    NSLog(@"Delegate: We have been disconnected from the server");
    gameType = NO_CURRENT_GAME;
}

- (void) processServerStatistics:(RSStatusUpdate *) newStats {
    if(viewController) {
        [viewController updateServerStatistics:newStats];
    }    
}

- (void) processGameUpdate:(RSGameUpdate *) newUpdate {
    NSLog(@"Delegate: Processing updated Game information");
    [gameViewController processGameUpdate:newUpdate];
}

- (void) gameCenterLoginSuccessful: (NSString *) playerNickname {
    [networkClient assignNickname:playerNickname];
}

- (void) assignNickname {
    NSString *nick = [gameCenter getNickname];
    if(nick && [networkClient isConnected]) {
        [networkClient assignNickname:nick];
    }
}

- (void) gameEnded:(BOOL) winner {
    if(winner) {
        NSLog(@"Delegate: Game has ended, we have won!");
    } else {
        NSLog(@"Delegate: Game has ended, we have lost!");
    }
    [gameViewController gameEnded:winner];
}

- (void) assignViewController:(RSViewController *) newViewController {
    viewController = newViewController;
}

- (void) assignGameViewController:(RSGameViewController *) newViewController {
    gameViewController = newViewController;
}

@end
