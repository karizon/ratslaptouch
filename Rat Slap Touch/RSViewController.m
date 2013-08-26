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
    [appDelegate joinTwoPlayerGame];
}

- (IBAction)joinFourPlayerGame:(id)sender {
    [appDelegate joinFourPlayerGame];
}

- (void) updateServerStatistics:(RSStatusUpdate *)stats {
    NSLog(@"RSView: Updating Stats on display");
    [_activePlayersLabel setText:[NSString stringWithFormat:@"%d",[stats clients]]];
    [_activeGamesLabel setText:[NSString stringWithFormat:@"%d",[stats games]]];
    [_waitingTwoPlayerGames setText:[NSString stringWithFormat:@"%d",[stats twoWaiting]]];
    [_waitingFourPlayerGames setText:[NSString stringWithFormat:@"%d",[stats fourWaiting]]];
}

@end
