//
//  RSGameViewController.m
//  Rat Slap Touch
//
//  Created by mandrake on 9/2/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameViewController.h"
#import "RSAppDelegate.h"
#import "RSGameView.h"
#import "RSVisibleCard.h"
#import "RSGameUpdate.h"
#import "RSRoundUpdate.h"

@implementation RSGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // NSLog(@"RSGameView: Loaded");
    appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate assignGameViewController:self];
    
    /*
    [gameView addCardToPlayed:@"K" suit:SUIT_CLUB];
    [gameView addCardToPlayed:@"J" suit:SUIT_DIAMOND];
    [gameView addCardToPlayed:@"3" suit:SUIT_SPADE];
    [gameView addCardToPlayed:@"Q" suit:SUIT_HEART];
     */

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if((orientation == 0) || (orientation == UIInterfaceOrientationPortrait))  {
        [gameView setOrientationHorizontal:NO];
    } else if((orientation == UIInterfaceOrientationLandscapeLeft)
              || (orientation == UIInterfaceOrientationLandscapeRight)) {
        [gameView setOrientationHorizontal:YES];
    }
}

- (void) addCardToPlayed:(RSVisibleCard *) newCard {
    [gameView addCardToPlayed:[newCard face] suit:[newCard suit]];
}


- (void)didMoveToParentViewController:(UIViewController *)parent {
    // parent is nil if this view controller was removed
    if(!parent) {
        [appDelegate abandonGame];
    }
}


- (IBAction)gameMenuHelp:(id)sender {
    NSLog(@"RSGameView: Game Menu Help Called");
}

- (void) gameEnded:(BOOL)winner {
    NSLog(@"RSGameView: Game has ended  Presenting Dialog");
    if(winner) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over!"
                                                        message:@"Congratulations you are the winner!"
                                                       delegate:self
                                              cancelButtonTitle:@"Huzzah!"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over!"
                                                        message:@"You have lost the game :(\nBetter luck next time!"
                                                       delegate:self
                                              cancelButtonTitle:@"Done"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [appDelegate abandonGame];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return YES;
}

- (void) processGameUpdate:(RSGameUpdate *) newUpdate {
    [gameView setPlayers:[newUpdate players]
                   total:[newUpdate gameSize]
                position:[newUpdate position]
             playerNames:[newUpdate playerNames]];
    if([newUpdate gameStatus] == GAME_STARTING) {
        [gameView setWaiting:NO];
    }
}

- (void) processRoundUpdate:(RSRoundUpdate *) newUpdate {
    NSLog(@"RSGameView: Processing Round Update");
    [gameView setActivePlayer:[newUpdate whoseMove]];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [gameView setOrientationHorizontal:YES];
    } else if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
               toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [gameView setOrientationHorizontal:NO];
    }
}

- (void) playerPlayedCard:(BOOL) stack {
    [appDelegate playerPlayedCard:stack];
}
@end
