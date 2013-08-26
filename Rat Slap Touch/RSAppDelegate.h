//
//  RSAppDelegate.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>


#define NO_CURRENT_GAME 0
#define TWO_PLAYER_GAME 1
#define FOUR_PLAYER_GAME 2

@class RSNetworkController;
@class RSStatusUpdate;
@class RSViewController;

@interface RSAppDelegate : UIResponder <UIApplicationDelegate> {
    int gameType;
    RSNetworkController *networkClient;
    RSViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;


- (void) joinTwoPlayerGame;
- (void) joinFourPlayerGame;

- (void) assignViewController:(RSViewController *) newViewController;

- (void) processDisconnect;
- (void) processServerStatistics:(RSStatusUpdate *) newStats;

@end
