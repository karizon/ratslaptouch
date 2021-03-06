//
//  RSAppDelegate.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NO_CURRENT_GAME 0
#define TWO_PLAYER_GAME 2
#define FOUR_PLAYER_GAME 4

@class RSNetworkController;
@class RSStatusUpdate;
@class RSViewController;
@class RSGameViewController;
@class RSGCHelper;
@class RSGameUpdate;
@class RSRoundUpdate;
@class RSVisibleCard;

@interface RSAppDelegate : UIResponder <UIApplicationDelegate> {
    int gameType;
    RSNetworkController *networkClient;
    RSViewController *viewController;
    RSGameViewController *gameViewController;
    RSGCHelper *gameCenter;
}

@property (strong, nonatomic) UIWindow *window;

- (void) resumeGame;
- (void) abandonGame;
- (void) joinGame:(int) newGameType;
- (int) isInGameType;
- (void) assignNickname;

- (void) assignViewController:(RSViewController *) newViewController;
- (void) assignGameViewController:(RSGameViewController *) newViewController;

- (void) processConnect;
- (void) processDisconnect;
- (void) processServerStatistics:(RSStatusUpdate *) newStats;
- (void) processGameUpdate: (RSGameUpdate *) newUpdate;
- (void) processRoundUpdate: (RSRoundUpdate *) newUpdate;

- (void) gameCenterLoginSuccessful: (NSString *)playerNickname;
- (void) gameEnded:(BOOL) winner;

- (void) playerPlayedCard:(BOOL) stack;
- (void) addCardToPlayed:(RSVisibleCard *) newCard;
@end
