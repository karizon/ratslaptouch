//
//  RSRoundUpdate.h
//  Rat Slap Touch
//
//  Created by mandrake on 9/22/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSRoundUpdate : NSObject {
    NSMutableArray *handSizes;
    int whoseMove;
}

- (id) initWithHandSizes:(NSMutableArray *) newHandSizes
               whoseMove:(int) newMove;

- (int) whoseMove;
- (NSMutableArray *) handSizes;

@end
