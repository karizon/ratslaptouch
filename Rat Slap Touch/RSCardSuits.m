//
//  RSCardSuits.m
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 9/17/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSCardSuits.h"

@implementation RSCardSuits

+ (UIBezierPath *) createSpadeAtPoint:(CGPoint) point
                                isPad:(BOOL) isPad {
    UIBezierPath *spadePath = [UIBezierPath bezierPath];
    if(isPad) {
        [spadePath moveToPoint: CGPointMake(point.x + 59.11, point.y + 151.45)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 68.04, point.y + 167.19)
                     controlPoint1: CGPointMake(point.x + 60.88, point.y + 150.18)
                     controlPoint2: CGPointMake(point.x + 68.5, point.y + 158.65)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 59.11, point.y + 184)
                     controlPoint1: CGPointMake(point.x + 67.6, point.y + 175.57)
                     controlPoint2: CGPointMake(point.x + 59.11, point.y + 184)];
        [spadePath addLineToPoint: CGPointMake(point.x + 76.98, point.y + 184)];
        [spadePath addLineToPoint: CGPointMake(point.x + 90.38, point.y + 184)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 81.45, point.y + 167.19)
                     controlPoint1: CGPointMake(point.x + 90.38, point.y + 184)
                     controlPoint2: CGPointMake(point.x + 81.86, point.y + 174.91)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 90.38, point.y + 151.45)
                     controlPoint1: CGPointMake(point.x + 80.96, point.y + 158.12)
                     controlPoint2: CGPointMake(point.x + 88.67, point.y + 150.28)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 117.19, point.y + 151.45)
                     controlPoint1: CGPointMake(point.x + 99.56, point.y + 157.73)
                     controlPoint2: CGPointMake(point.x + 111.09, point.y + 159.01)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 91.17, point.y + 73.68)
                     controlPoint1: CGPointMake(point.x + 138.26, point.y + 125.31)
                     controlPoint2: CGPointMake(point.x + 112.24, point.y + 99.81)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 58.32, point.y + 73.68)
                     controlPoint1: CGPointMake(point.x + 70.1, point.y + 47.55)
                     controlPoint2: CGPointMake(point.x + 79.4, point.y + 47.55)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 32.3, point.y + 151.45)
                     controlPoint1: CGPointMake(point.x + 37.25, point.y + 99.81)
                     controlPoint2: CGPointMake(point.x + 11.23, point.y + 125.31)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 59.11, point.y + 151.45)
                     controlPoint1: CGPointMake(point.x + 38.91, point.y + 159.65)
                     controlPoint2: CGPointMake(point.x + 50.35, point.y + 157.68)];
        
    } else {
        [spadePath moveToPoint: CGPointMake(point.x + 30.42, point.y + 72.99)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 34.47, point.y + 79.52)
                     controlPoint1: CGPointMake(point.x + 31.22, point.y + 72.47)
                     controlPoint2: CGPointMake(point.x + 34.67, point.y + 75.98)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 30.42, point.y + 86.5)
                     controlPoint1: CGPointMake(point.x + 34.27, point.y + 83)
                     controlPoint2: CGPointMake(point.x + 30.42, point.y + 86.5)];
        [spadePath addLineToPoint: CGPointMake(point.x + 38.51, point.y + 86.5)];
        [spadePath addLineToPoint: CGPointMake(point.x + 44.58, point.y + 86.5)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 40.53, point.y + 79.52)
                     controlPoint1: CGPointMake(point.x + 44.58, point.y + 86.5)
                     controlPoint2: CGPointMake(point.x + 40.72, point.y + 82.73)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 44.58, point.y + 72.99)
                     controlPoint1: CGPointMake(point.x + 40.31, point.y + 75.76)
                     controlPoint2: CGPointMake(point.x + 43.8, point.y + 72.5)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 56.71, point.y + 72.99)
                     controlPoint1: CGPointMake(point.x + 48.74, point.y + 75.6)
                     controlPoint2: CGPointMake(point.x + 53.95, point.y + 76.13)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 44.93, point.y + 40.72)
                     controlPoint1: CGPointMake(point.x + 66.25, point.y + 62.14)
                     controlPoint2: CGPointMake(point.x + 54.47, point.y + 51.56)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 30.07, point.y + 40.72)
                     controlPoint1: CGPointMake(point.x + 35.39, point.y + 29.87)
                     controlPoint2: CGPointMake(point.x + 39.61, point.y + 29.87)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 18.29, point.y + 72.99)
                     controlPoint1: CGPointMake(point.x + 20.53, point.y + 51.56)
                     controlPoint2: CGPointMake(point.x + 8.75, point.y + 62.14)];
        [spadePath addCurveToPoint: CGPointMake(point.x + 30.42, point.y + 72.99)
                     controlPoint1: CGPointMake(point.x + 21.28, point.y + 76.39)
                     controlPoint2: CGPointMake(point.x + 26.46, point.y + 75.58)];
        
    }
    [spadePath closePath];

    return spadePath;
}

+ (UIBezierPath *) createClubAtPoint:(CGPoint) point
                               isPad:(BOOL) isPad {
    return nil;
}

+ (UIBezierPath *) createHeartAtPoint:(CGPoint) point
                                isPad:(BOOL) isPad {
    UIBezierPath *heartPath = [UIBezierPath bezierPath];
    if(isPad) {
        [heartPath moveToPoint: CGPointMake(point.x + 75.58, point.y + 181)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 105.52, point.y + 131.53)
                     controlPoint1: CGPointMake(point.x + 75.58, point.y + 181)
                     controlPoint2: CGPointMake(point.x + 98.61, point.y + 143.25)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 116, point.y + 66)
                     controlPoint1: CGPointMake(point.x + 119.35, point.y + 108.09)
                     controlPoint2: CGPointMake(point.x + 129.83, point.y + 89.44)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 87.63, point.y + 59.58)
                     controlPoint1: CGPointMake(point.x + 112.56, point.y + 60.17)
                     controlPoint2: CGPointMake(point.x + 97.27, point.y + 53.21)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 75.59, point.y + 75.31)
                     controlPoint1: CGPointMake(point.x + 77.52, point.y + 66.26)
                     controlPoint2: CGPointMake(point.x + 75.59, point.y + 75.31)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 62.54, point.y + 59.58)
                     controlPoint1: CGPointMake(point.x + 75.59, point.y + 75.31)
                     controlPoint2: CGPointMake(point.x + 73.5, point.y + 66.05)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 35, point.y + 66)
                     controlPoint1: CGPointMake(point.x + 51.15, point.y + 52.85)
                     controlPoint2: CGPointMake(point.x + 38.45, point.y + 60.15)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 45.86, point.y + 131.53)
                     controlPoint1: CGPointMake(point.x + 21.17, point.y + 89.44)
                     controlPoint2: CGPointMake(point.x + 32.03, point.y + 108.09)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 75.58, point.y + 181)
                     controlPoint1: CGPointMake(point.x + 52.77, point.y + 143.25)
                     controlPoint2: CGPointMake(point.x + 75.58, point.y + 181)];
    } else {
        [heartPath moveToPoint: CGPointMake(point.x + 36.57, point.y + 87)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 52.48, point.y + 65.03)
                     controlPoint1: CGPointMake(point.x + 36.57, point.y + 87)
                     controlPoint2: CGPointMake(point.x + 48.8, point.y + 70.24)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 58.05, point.y + 35.93)
                     controlPoint1: CGPointMake(point.x + 59.82, point.y + 54.62)
                     controlPoint2: CGPointMake(point.x + 65.39, point.y + 46.34)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 42.97, point.y + 33.08)
                     controlPoint1: CGPointMake(point.x + 56.22, point.y + 33.34)
                     controlPoint2: CGPointMake(point.x + 48.09, point.y + 30.25)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 36.57, point.y + 40.07)
                     controlPoint1: CGPointMake(point.x + 37.59, point.y + 36.05)
                     controlPoint2: CGPointMake(point.x + 36.57, point.y + 40.07)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 29.63, point.y + 33.08)
                     controlPoint1: CGPointMake(point.x + 36.57, point.y + 40.07)
                     controlPoint2: CGPointMake(point.x + 35.46, point.y + 35.95)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 15, point.y + 35.93)
                     controlPoint1: CGPointMake(point.x + 23.58, point.y + 30.09)
                     controlPoint2: CGPointMake(point.x + 16.83, point.y + 33.33)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 20.77, point.y + 65.03)
                     controlPoint1: CGPointMake(point.x + 7.65, point.y + 46.34)
                     controlPoint2: CGPointMake(point.x + 13.42, point.y + 54.62)];
        [heartPath addCurveToPoint: CGPointMake(point.x + 36.57, point.y + 87)
                     controlPoint1: CGPointMake(point.x + 24.44, point.y + 70.24)
                     controlPoint2: CGPointMake(point.x + 36.57, point.y + 87)];
    }
    [heartPath closePath];

    return heartPath;
}

+ (UIBezierPath *) createDiamondAtPoint:(CGPoint) point
                                  isPad:(BOOL) isPad {
    UIBezierPath *diamondPath = [UIBezierPath bezierPath];
    if(isPad) {
        [diamondPath moveToPoint: CGPointMake(point.x + 75.5, point.y + 198.5)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 119.5, point.y + 118.98)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 75.5, point.y + 40.5)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 31.5, point.y + 118.98)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 75.5, point.y + 198.5)];
    } else {
        [diamondPath moveToPoint: CGPointMake(point.x + 38, point.y + 98.5)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 58.5, point.y + 61.96)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 38, point.y + 22.5)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 17.5, point.y + 61.96)];
        [diamondPath addLineToPoint: CGPointMake(point.x + 38, point.y + 98.5)];
    }

    return diamondPath;
}

@end
