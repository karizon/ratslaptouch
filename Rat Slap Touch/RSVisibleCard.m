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
    }
    return self;
}

- (id) initShowingWithFace:(NSString *) newFace suit:(char) newSuit cardSize:(CGRect) newCardSize cardPosition:(CGPoint) newCardPosition {
    self = [RSVisibleCard init];
    if(self) {
        face = newFace;
        suit = newSuit;
        cardSize = newCardSize;
        cardPosition = newCardPosition;
        showing = YES;
    }
    return self;
}

- (id) initWithCardSize:(CGRect) newCardSize cardPosition:(CGPoint) newCardPosition {
    self = [RSVisibleCard init];
    if(self) {
        cardSize = newCardSize;
        cardPosition = newCardPosition;
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
@end
