//
//  RSViewController.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSAppDelegate;
@class RSStatusUpdate;

@interface RSViewController : UIViewController {
    RSAppDelegate *appDelegate;
    int queuedGameType;
}

@property (weak, nonatomic) IBOutlet UILabel *activePlayersLabel;
@property (weak, nonatomic) IBOutlet UILabel *activeGamesLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitingTwoPlayerGames;
@property (weak, nonatomic) IBOutlet UILabel *waitingFourPlayerGames;

- (IBAction)joinTwoPlayerGame:(id)sender;
- (IBAction)joinFourPlayerGame:(id)sender;
- (IBAction)mainMenuHelp:(id)sender;
- (IBAction)gameMenuHelp:(id)sender;

- (void) updateServerStatistics:(RSStatusUpdate *) stats;

@end
