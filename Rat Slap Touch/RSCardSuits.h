//
//  RSCardSuits.h
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 9/17/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSCardSuits : NSObject

+ (UIBezierPath *) createSpadeAtPoint:(CGPoint) point
                                isPad:(BOOL) isPad;

+ (UIBezierPath *) createClubAtPoint:(CGPoint) point
                               isPad:(BOOL) isPad;

+ (UIBezierPath *) createHeartAtPoint:(CGPoint) point
                                isPad:(BOOL) isPad;

+ (UIBezierPath *) createDiamondAtPoint:(CGPoint) point
                                  isPad:(BOOL) isPad;
@end
