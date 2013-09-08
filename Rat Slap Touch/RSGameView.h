//
//  RSGameView.h
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSVisibleCard;

@interface RSGameView : UIView {
    BOOL stillWaiting;
    BOOL horizontal;
    int totalPlayers;
    int currentPlayers;
    NSMutableArray *visibleCards;
}

+ (BOOL) isPad;

- (void) drawBackground;

- (void) drawStarAtX: (float) x y: (float) y alpha: (float) alpha;
- (void) drawCardBackAtX: (float) x y: (float) y alpha: (float) alpha;
- (void) drawCardAtX: (float) x y:(float) y suit:(char) suit card:(NSString *) card;

- (void) setWaiting: (BOOL) waiting;
- (void) setPlayers: (int) current total:(int) total;
- (void) setOrientationHorizontal: (BOOL) isHorizontal;

@end
