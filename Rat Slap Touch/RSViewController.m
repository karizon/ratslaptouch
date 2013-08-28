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

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"RSView: Loaded");
    appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate assignViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinTwoPlayerGame:(id)sender {
    NSLog(@"RSView: About to join two player game");
    queuedGameType = TWO_PLAYER_GAME;
}

- (IBAction)joinFourPlayerGame:(id)sender {
    NSLog(@"RSView: About to join four player game");
    queuedGameType = FOUR_PLAYER_GAME;
}

- (void) updateServerStatistics:(RSStatusUpdate *)stats {
    NSLog(@"RSView: Updating Stats on display");
    [_activePlayersLabel setText:[NSString stringWithFormat:@"%d",[stats clients]]];
    [_activeGamesLabel setText:[NSString stringWithFormat:@"%d",[stats games]]];
    [_waitingTwoPlayerGames setText:[NSString stringWithFormat:@"%d",[stats twoWaiting]]];
    [_waitingFourPlayerGames setText:[NSString stringWithFormat:@"%d",[stats fourWaiting]]];
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"RSView: Testing to see if we should transition");
    int gameType = [appDelegate isInGameType];
    if(gameType == queuedGameType) {
        [appDelegate resumeGame];
        return YES;
    } else if(gameType == NO_CURRENT_GAME) {
        [appDelegate joinGame:queuedGameType];
        return YES;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Abandon Game?"
                                                        message:@"Are you sure that you want to abandon your curent game?"
                                                       delegate:self
                                              cancelButtonTitle:@"No!"
                                              otherButtonTitles:@"Yes!", nil];
        [alert show];
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        NSLog(@"RSView: We apparently want to kill the old game!");
        [appDelegate abandonGame];
        [appDelegate joinGame:queuedGameType];
    }
}

@end
