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
    int myPosition;
    BOOL touchPending;
    RSVisibleCard *touchedCard;
}

+ (BOOL) isPad;

- (void) drawBackground;

- (void) drawStarAt:(CGPoint) point
              alpha: (float) alpha;
- (void) drawCardBackAt:(CGPoint) point
                  alpha:(float) alpha
               vertical:(BOOL) vertical;
- (void) drawCardAt:(CGPoint) point
               suit:(char) suit
               card:(NSString *) card;

- (CGRect) getPlayer1Position;
- (CGRect) getPlayer2Position;
- (CGRect) getPlayer3Position;
- (CGRect) getPlayer4Position;

- (void) drawPlayerHighlight:(CGPoint) position;

- (void) drawVisibleStackedCards;
- (void) drawVisiblePlayedCards;

- (void) repositionPlayedCards;
- (void) repositionStackedCards;

- (void) setWaiting: (BOOL) waiting;
- (void) setPlayers: (int) current
              total:(int) total
           position:(int) position;

- (void) setOrientationHorizontal: (BOOL) isHorizontal;

- (void) addCardToPlayed:(NSString *) card
                    suit:(char) suit;
@end
