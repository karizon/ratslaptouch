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
    NSMutableArray *visibleStackedCards;
    NSMutableArray *visiblePlayedCards;
    int maxStackVisible;
    int maxPlayedVisible;
    BOOL touchPending;
}

+ (BOOL) isPad;

- (void) drawBackground;

- (void) drawStarAt:(CGPoint) point alpha: (float) alpha;
- (void) drawCardBackAt:(CGPoint) point alpha:(float) alpha;
- (void) drawCardAt:(CGPoint) point suit:(char) suit card:(NSString *) card;

- (void) drawVisibleStackedCards;
- (void) drawVisiblePlayedCards;

- (void) repositionPlayedCards;

- (void) setWaiting: (BOOL) waiting;
- (void) setPlayers: (int) current total:(int) total position:(int) position;
- (void) setOrientationHorizontal: (BOOL) isHorizontal;

- (void) addCardToPlayed:(NSString *) card suit:(char) suit;
@end
