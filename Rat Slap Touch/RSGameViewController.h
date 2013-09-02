//
//  RSGameViewController.h
//  Rat Slap Touch
//
//  Created by mandrake on 9/2/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSAppDelegate;
@class RSGameView;

@interface RSGameViewController : UIViewController {
    RSAppDelegate *appDelegate;
    __weak IBOutlet RSGameView *gameView;
}

- (IBAction)gameMenuHelp:(id)sender;

@end
