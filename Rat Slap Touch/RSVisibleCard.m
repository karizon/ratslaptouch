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

@end
