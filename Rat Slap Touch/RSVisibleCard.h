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
}

- (id) initShowingWithFace:(NSString *) newFace suit:(char) newSuit cardSize:(CGRect) newCardSize cardPosition:(CGPoint) newCardPosition;
- (id) initWithCardSize:(CGRect) newCardSize cardPosition:(CGPoint) newCardPosition;

- (char) suit;
- (BOOL) showing;
- (BOOL) active;
- (NSString *) face;
- (BOOL) playable;
- (CGRect) cardSize;
- (CGPoint) cardPosition;
- (int) belongsToPlayer;

- (void) setPlayer: (int) newPlayer;

@end
