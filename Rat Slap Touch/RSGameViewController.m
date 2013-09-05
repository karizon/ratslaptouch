//
//  RSGameViewController.m
//  Rat Slap Touch
//
//  Created by mandrake on 9/2/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameViewController.h"
#import "RSAppDelegate.h"

@implementation RSGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // NSLog(@"RSGameView: Loaded");
    appDelegate = (RSAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate assignGameViewController:self];
    [UIViewController attemptRotationToDeviceOrientation];
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
