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
#import "RSGameUpdate.h"

@implementation RSGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // NSLog(@"RSGameView: Loaded");
    appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate assignGameViewController:self];

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if((orientation == 0) || (orientation == UIInterfaceOrientationPortrait))  {
        [gameView setOrientationHorizontal:NO];
    } else if((orientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationLandscapeRight)) {
        [gameView setOrientationHorizontal:YES];
    }
}


- (void)didMoveToParentViewController:(UIViewController *)parent {
    // parent is nil if this view controller was removed
    if(!parent) {
        NSLog(@"RSGameView: We should be pausing the game, returning to main menu now");
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
    NSLog(@"RSGameView: Being asked if I rotate in a direction.  Answering Yes");
    return YES;
}

- (void) processGameUpdate:(RSGameUpdate *) newUpdate {
    [gameView setPlayers:[newUpdate players] total:[newUpdate gameSize]];
    if([newUpdate gameStatus] == GAME_STARTING) {
        [gameView setWaiting:NO];
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        NSLog(@"RSGameView: have changed to landscape");
        [gameView setOrientationHorizontal:YES];
    } else if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        NSLog(@"RSGameView: have changed to portrait");
        [gameView setOrientationHorizontal:NO];
    }
}
@end
