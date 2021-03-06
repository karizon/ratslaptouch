//
//  RSVisibleCard.h
//  Rat Slap Touch
//
//  Created by mandrake on 9/8/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SUIT_UNDEFINED 0
#define SUIT_SPADE 1
#define SUIT_CLUB 2
#define SUIT_HEART 3
#define SUIT_DIAMOND 4

@interface RSVisibleCard : NSObject {
    char suit;
    BOOL showing;
    BOOL active;
    NSString *face;
    BOOL playable;
    CGRect cardSize;
    CGPoint cardPosition;
    int belongsToPlayer;
    BOOL draggable;
}

- (id) initShowingWithFace:(NSString *) newFace
                      suit:(char) newSuit
                  cardSize:(CGRect) newCardSize;
- (id) initWithCardSize:(CGRect) newCardSize;

- (char) suit;
- (BOOL) showing;
- (BOOL) active;
- (NSString *) face;
- (BOOL) playable;
- (CGRect) cardSize;
- (CGPoint) cardPosition;
- (int) belongsToPlayer;

- (void) setPlayer: (int) newPlayer;
- (void) setDraggable: (BOOL) newDraggable;
- (void) setPosition: (CGPoint) newPosition;
- (void) setCardSize: (CGRect) newCardSize;
- (void) setShowing:(BOOL) newShowing;
- (void) setActive: (BOOL) newActive;
- (void) setFace:(NSString *) newFace;

@end
