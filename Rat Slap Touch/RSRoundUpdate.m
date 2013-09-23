//
//  RSRoundUpdate.m
//  Rat Slap Touch
//
//  Created by mandrake on 9/22/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSRoundUpdate.h"

@implementation RSRoundUpdate

- (id) initWithHandSizes:(NSMutableArray *)newHandSizes whoseMove:(int)newMove {
    self = [super init];
    if(self) {
        handSizes = newHandSizes;
        whoseMove = newMove;
    }
    
    return self;
}

- (int) whoseMove {
    return whoseMove;
}

- (NSMutableArray *) handSizes {
    return handSizes;
}

@end
