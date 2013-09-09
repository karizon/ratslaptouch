//
//  RSVisibleCard.m
//  Rat Slap Touch
//
//  Created by mandrake on 9/8/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSVisibleCard.h"

@implementation RSVisibleCard

- (id) init {
    self = [super init];
    if(self) {
        suit = SUIT_UNDEFINED;
        showing = NO;
        face = nil;
        playable = NO;
        belongsToPlayer = 0;
        active = YES;
        draggable = NO;
    }
    return self;
}

- (id) initShowingWithFace:(NSString *) newFace suit:(char) newSuit cardSize:(CGRect) newCardSize {
    self = [RSVisibleCard init];
    if(self) {
        face = newFace;
        suit = newSuit;
        cardSize = newCardSize;
        cardPosition = CGPointMake(cardSize.origin.x, cardSize.origin.y);
        showing = YES;
    }
    return self;
}

- (id) initWithCardSize:(CGRect) newCardSize {
    self = [RSVisibleCard init];
    if(self) {
        cardSize = newCardSize;
        cardPosition = CGPointMake(cardSize.origin.x, cardSize.origin.y);
    }
    return self;
}

- (char) suit {
    return suit;
}

- (BOOL) showing {
    return showing;
}

- (BOOL) active {
    return active;
}

- (NSString *) face {
    return face;
}

- (BOOL) playable {
    return playable;
}

- (void) setPlayable: (BOOL) newPlayable {
    playable = newPlayable;
}

- (CGRect) cardSize {
    return cardSize;
}

- (CGPoint) cardPosition {
    return cardPosition;
}

- (int) belongsToPlayer {
    return belongsToPlayer;
}

- (void) setPlayer: (int) newPlayer {
    belongsToPlayer = newPlayer;
}
- (BOOL) draggable {
    return draggable;
}

@end
