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


@end
