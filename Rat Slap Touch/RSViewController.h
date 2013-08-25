//
//  RSViewController.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *activePlayersLabel;
@property (weak, nonatomic) IBOutlet UILabel *activeGamesLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitingTwoPlayerGames;
@property (weak, nonatomic) IBOutlet UILabel *waitingFourPlayerGames;

- (IBAction)joinTwoPlayerGame:(id)sender;
- (IBAction)joinFourPlayerGame:(id)sender;

@end
