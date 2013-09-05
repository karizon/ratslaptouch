//
//  RSGameView.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSGameView : UIView

#define SUIT_SPADE 1
#define SUIT_CLUB 2
#define SUIT_HEART 3
#define SUIT_DIAMOND 4

- (void) drawBackground;

- (void) drawCardBackAtX: (float) x y: (float) y;
- (void) drawStarAtX: (float) x y: (float) y;

- (void) drawCardAtX: (float) x y:(float) y suit:(int) suit card:(NSString *) card;

+ (BOOL) isPad;

@end
