//
//  RSViewController.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSViewController.h"
#import "RSAppDelegate.h"
#import "RSStatusUpdate.h"

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate assignViewController:self];
    queuedGameType = NO_CURRENT_GAME;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinTwoPlayerGame:(id)sender {
    if(queuedGameType != TWO_PLAYER_GAME) {
        queuedGameType = TWO_PLAYER_GAME;
    }
}

- (IBAction)joinFourPlayerGame:(id)sender {
    if(queuedGameType != FOUR_PLAYER_GAME) {
        queuedGameType = FOUR_PLAYER_GAME;
    }
}


- (void) updateServerStatistics:(RSStatusUpdate *)stats {
    [_activePlayersLabel setText:[NSString stringWithFormat:@"%d",[stats clients]]];
    [_activeGamesLabel setText:[NSString stringWithFormat:@"%d",[stats games]]];
    [_waitingTwoPlayerGames setText:[NSString stringWithFormat:@"%d",[stats twoWaiting]]];
    [_waitingFourPlayerGames setText:[NSString stringWithFormat:@"%d",[stats fourWaiting]]];
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    int gameType = [appDelegate isInGameType];
    if(gameType == queuedGameType) {
        [appDelegate resumeGame];
        return YES;
    } else if(gameType == NO_CURRENT_GAME) {
        [appDelegate joinGame:queuedGameType];
        return YES;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Abandon Game?"
                                                        message:@"Are you sure that you want to abandon your current game and join a new one?"
                                                       delegate:self
                                              cancelButtonTitle:@"No!"
                                              otherButtonTitles:@"Yes!", nil];
        [alert show];
    }
    return NO;
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        [appDelegate abandonGame];
        [appDelegate joinGame:queuedGameType];
        [self performSegueWithIdentifier:@"gameStartSegue" sender:self];
    }
}

- (void) serverNotAvailable {
    [_activePlayersLabel setText:[NSString stringWithFormat:@"N/A"]];
    [_activeGamesLabel setText:[NSString stringWithFormat:@"N/A"]];
    [_waitingTwoPlayerGames setText:[NSString stringWithFormat:@"N/A"]];
    [_waitingFourPlayerGames setText:[NSString stringWithFormat:@"N/A"]];
    [_join2PlayerButton setEnabled:NO];
    [_join4PlayerButton setEnabled:NO];
}

- (void) serverAvailable {
    [_join2PlayerButton setEnabled:YES];
    [_join4PlayerButton setEnabled:YES];
}

- (IBAction)mainMenuHelp:(id)sender {
    NSLog(@"RSView: Main Menu Help Called");
}

@end
