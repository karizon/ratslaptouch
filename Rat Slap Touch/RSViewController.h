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
    int currentGameType;
}

@property (weak, nonatomic) IBOutlet UILabel *activePlayersLabel;
@property (weak, nonatomic) IBOutlet UILabel *activeGamesLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitingTwoPlayerGames;
@property (weak, nonatomic) IBOutlet UILabel *waitingFourPlayerGames;
@property (weak, nonatomic) IBOutlet UIButton *join2PlayerButton;
@property (weak, nonatomic) IBOutlet UIButton *join4PlayerButton;

- (IBAction)joinTwoPlayerGame:(id)sender;
- (IBAction)joinFourPlayerGame:(id)sender;
- (IBAction)mainMenuHelp:(id)sender;

- (void) updateServerStatistics:(RSStatusUpdate *) stats;
- (void) serverNotAvailable;
- (void) serverAvailable;

@end
