//
//  RSGameView.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameView.h"

@implementation RSGameView


+ (BOOL) isPad {
#ifdef UI_USER_INTERFACE_IDIOM
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#endif
    return NO;
}

- (void) gameViewInit {
    NSLog(@"Game View: Initializing (new game board)");
    if([RSGameView isPad]) {
        NSLog(@"Game View: We're drawing on an iPad, folks!");
    }
    stillWaiting = YES;
    totalPlayers = 0;
    currentPlayers = 0;
    return;
    [UIViewController attemptRotationToDeviceOrientation];
}

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self gameViewInit];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self gameViewInit];
    }
    return self;
}

- (void) drawStarAtX: (float) x y: (float) y  alpha: (float) alpha{
    // Draw Star w/ first point @ x,y
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    if([RSGameView isPad]) {
        [starPath moveToPoint: CGPointMake(x, y)];
        [starPath addLineToPoint: CGPointMake(x + 5.82, y + 9.01)];
        [starPath addLineToPoint: CGPointMake(x + 15.69, y + 12.09)];
        [starPath addLineToPoint: CGPointMake(x + 9.42, y + 20.74)];
        [starPath addLineToPoint: CGPointMake(x + 9.7, y + 31.66)];
        [starPath addLineToPoint: CGPointMake(x + 0, y + 28)];
        [starPath addLineToPoint: CGPointMake(x - 9.7, y + 31.66)];
        [starPath addLineToPoint: CGPointMake(x - 9.42, y + 20.74)];
        [starPath addLineToPoint: CGPointMake(x - 15.69, y + 12.09)];
        [starPath addLineToPoint: CGPointMake(x - 5.82, y + 9.01)];
        [starPath addLineToPoint: CGPointMake(x , y)];
        [[UIColor blackColor] setStroke];
        starPath.lineWidth = 1;
        [starPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    } else {
        [starPath moveToPoint: CGPointMake(x, y)];
        [starPath addLineToPoint: CGPointMake(x + 2.65, y + 4.37)];
        [starPath addLineToPoint: CGPointMake(x + 7.13, y + 5.87)];
        [starPath addLineToPoint: CGPointMake(x + 4.28, y + 10.08)];
        [starPath addLineToPoint: CGPointMake(x + 4.41, y + 15.38)];
        [starPath addLineToPoint: CGPointMake(x, y + 13.6)];
        [starPath addLineToPoint: CGPointMake(x - 4.41, y + 15.38)];
        [starPath addLineToPoint: CGPointMake(x - 4.28, y + 10.08)];
        [starPath addLineToPoint: CGPointMake(x - 7.13, y + 5.87)];
        [starPath addLineToPoint: CGPointMake(x - 2.65, y + 4.37)];
        [starPath addLineToPoint: CGPointMake(x , y)];
        [[UIColor blackColor] setStroke];
        starPath.lineWidth = 1;
        [starPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    }
    [starPath closePath];
    [[UIColor whiteColor] setFill];
    [starPath fillWithBlendMode:kCGBlendModeNormal alpha:alpha];
}

- (void) drawCardBackAtX: (float) x y: (float) y alpha: (float) alpha {
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor* gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor* color2 =  [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    UIColor* color3 =  [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 0.3];
    
    // Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    // Shadow Declarations
    UIColor* shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    // Outer Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 150, 240) cornerRadius: 8];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        CGContextSetAlpha(context,alpha);
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(x - 20, y + 24), CGPointMake(x + 170, y + 220), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    } else {
        UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 75, 120) cornerRadius: 4];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        CGContextSetAlpha(context,alpha);
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(x - 10, y + 12), CGPointMake(x + 85, y + 110), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    }
    
    // Inner Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 10, y + 10, 128, 220) cornerRadius: 8];
        [color3 setFill];
        [innerCardPath fillWithBlendMode:kCGBlendModeNormal alpha:alpha];
    } else {
        UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 5, y + 5, 64, 110) cornerRadius: 4];
        [color3 setFill];
        [innerCardPath fillWithBlendMode:kCGBlendModeNormal alpha:alpha];
    }
    
    // Draw star card backs
    if([RSGameView isPad]) {
        for(float x2 = (x + 35); x2 < (x + 140); x2 += 40) {
            for(float y2 = (y + 24); y2 < (y + 200); y2 += 40) {
                [self drawStarAtX:x2 y:y2 alpha:1];
            }
        }
    } else {
        for(float x2 = (x + 17); x2 < (x + 75); x2 += 20) {
            for(float y2 = (y + 13); y2 < (y + 100); y2 += 20) {
                [self drawStarAtX:x2 y:y2 alpha:1];
            }
        }
    }

    // Cleanup
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);

}

- (void) drawCardAtX: (float) x y:(float) y suit:(int) suit card:(NSString *) card {
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.644 green: 0.078 blue: 0.078 alpha: 1];
    UIColor* gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* gradient2Color2 = [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    
    // Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)gradient2Color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    // Shadow Declarations
    UIColor* shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    // Outer Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 150, 240) cornerRadius: 8];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(x - 20, y + 20), CGPointMake(x + 200, y + 220), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath stroke];
    } else {
        UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 75, 120) cornerRadius: 4];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [outerCardPath addClip];
        // CGContextDrawLinearGradient(context, gradient2, CGPointMake(85.42, 17.92), CGPointMake(180.58, 113.08), 0);
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(x - 10, y + 10), CGPointMake(x + 100, y + 110), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath stroke];
    }

    // Inner Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 10, y + 10, 130, 220) cornerRadius: 8];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [[UIColor whiteColor] setFill];
        [innerCardPath fill];
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        innerCardPath.lineWidth = 1;
        [innerCardPath stroke];
    } else {
        UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 5, y + 5, 65, 110) cornerRadius: 4];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [[UIColor whiteColor] setFill];
        [innerCardPath fill];
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        innerCardPath.lineWidth = 1;
        [innerCardPath stroke];
    }
    
    // Assign the shadow for drawing all suits
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);

    if(suit == SUIT_SPADE) {
        UIBezierPath* spadePath = [UIBezierPath bezierPath];
        if([RSGameView isPad]) {
            [spadePath moveToPoint: CGPointMake(x + 59.11, y + 151.45)];
            [spadePath addCurveToPoint: CGPointMake(x + 68.04, y + 167.19) controlPoint1: CGPointMake(x + 60.88, y + 150.18) controlPoint2: CGPointMake(x + 68.5, y + 158.65)];
            [spadePath addCurveToPoint: CGPointMake(x + 59.11, y + 184) controlPoint1: CGPointMake(x + 67.6, y + 175.57) controlPoint2: CGPointMake(x + 59.11, y + 184)];
            [spadePath addLineToPoint: CGPointMake(x + 76.98, y + 184)];
            [spadePath addLineToPoint: CGPointMake(x + 90.38, y + 184)];
            [spadePath addCurveToPoint: CGPointMake(x + 81.45, y + 167.19) controlPoint1: CGPointMake(x + 90.38, y + 184) controlPoint2: CGPointMake(x + 81.86, y + 174.91)];
            [spadePath addCurveToPoint: CGPointMake(x + 90.38, y + 151.45) controlPoint1: CGPointMake(x + 80.96, y + 158.12) controlPoint2: CGPointMake(x + 88.67, y + 150.28)];
            [spadePath addCurveToPoint: CGPointMake(x + 117.19, y + 151.45) controlPoint1: CGPointMake(x + 99.56, y + 157.73) controlPoint2: CGPointMake(x + 111.09, y + 159.01)];
            [spadePath addCurveToPoint: CGPointMake(x + 91.17, y + 73.68) controlPoint1: CGPointMake(x + 138.26, y + 125.31) controlPoint2: CGPointMake(x + 112.24, y + 99.81)];
            [spadePath addCurveToPoint: CGPointMake(x + 58.32, y + 73.68) controlPoint1: CGPointMake(x + 70.1, y + 47.55) controlPoint2: CGPointMake(x + 79.4, y + 47.55)];
            [spadePath addCurveToPoint: CGPointMake(x + 32.3, y + 151.45) controlPoint1: CGPointMake(x + 37.25, y + 99.81) controlPoint2: CGPointMake(x + 11.23, y + 125.31)];
            [spadePath addCurveToPoint: CGPointMake(x + 59.11, y + 151.45) controlPoint1: CGPointMake(x + 38.91, y + 159.65) controlPoint2: CGPointMake(x + 50.35, y + 157.68)];

        } else {
            [spadePath moveToPoint: CGPointMake(x + 30.42, y + 72.99)];
            [spadePath addCurveToPoint: CGPointMake(x + 34.47, y + 79.52) controlPoint1: CGPointMake(x + 31.22, y + 72.47) controlPoint2: CGPointMake(x + 34.67, y + 75.98)];
            [spadePath addCurveToPoint: CGPointMake(x + 30.42, y + 86.5) controlPoint1: CGPointMake(x + 34.27, y + 83) controlPoint2: CGPointMake(x + 30.42, y + 86.5)];
            [spadePath addLineToPoint: CGPointMake(x + 38.51, y + 86.5)];
            [spadePath addLineToPoint: CGPointMake(x + 44.58, y + 86.5)];
            [spadePath addCurveToPoint: CGPointMake(x + 40.53, y + 79.52) controlPoint1: CGPointMake(x + 44.58, y + 86.5) controlPoint2: CGPointMake(x + 40.72, y + 82.73)];
            [spadePath addCurveToPoint: CGPointMake(x + 44.58, y + 72.99) controlPoint1: CGPointMake(x + 40.31, y + 75.76) controlPoint2: CGPointMake(x + 43.8, y + 72.5)];
            [spadePath addCurveToPoint: CGPointMake(x + 56.71, y + 72.99) controlPoint1: CGPointMake(x + 48.74, y + 75.6) controlPoint2: CGPointMake(x + 53.95, y + 76.13)];
            [spadePath addCurveToPoint: CGPointMake(x + 44.93, y + 40.72) controlPoint1: CGPointMake(x + 66.25, y + 62.14) controlPoint2: CGPointMake(x + 54.47, y + 51.56)];
            [spadePath addCurveToPoint: CGPointMake(x + 30.07, y + 40.72) controlPoint1: CGPointMake(x + 35.39, y + 29.87) controlPoint2: CGPointMake(x + 39.61, y + 29.87)];
            [spadePath addCurveToPoint: CGPointMake(x + 18.29, y + 72.99) controlPoint1: CGPointMake(x + 20.53, y + 51.56) controlPoint2: CGPointMake(x + 8.75, y + 62.14)];
            [spadePath addCurveToPoint: CGPointMake(x + 30.42, y + 72.99) controlPoint1: CGPointMake(x + 21.28, y + 76.39) controlPoint2: CGPointMake(x + 26.46, y + 75.58)];

        }
        [spadePath closePath];
        [color2 setFill];
        [spadePath fill];
    } else if(suit == SUIT_HEART) {
        UIBezierPath* heartPath = [UIBezierPath bezierPath];

        if([RSGameView isPad]) {
            [heartPath moveToPoint: CGPointMake(x + 75.58, y + 181)];
            [heartPath addCurveToPoint: CGPointMake(x + 105.52, y + 131.53) controlPoint1: CGPointMake(x + 75.58, y + 181) controlPoint2: CGPointMake(x + 98.61, y + 143.25)];
            [heartPath addCurveToPoint: CGPointMake(x + 116, y + 66) controlPoint1: CGPointMake(x + 119.35, y + 108.09) controlPoint2: CGPointMake(x + 129.83, y + 89.44)];
            [heartPath addCurveToPoint: CGPointMake(x + 87.63, y + 59.58) controlPoint1: CGPointMake(x + 112.56, y + 60.17) controlPoint2: CGPointMake(x + 97.27, y + 53.21)];
            [heartPath addCurveToPoint: CGPointMake(x + 75.59, y + 75.31) controlPoint1: CGPointMake(x + 77.52, y + 66.26) controlPoint2: CGPointMake(x + 75.59, y + 75.31)];
            [heartPath addCurveToPoint: CGPointMake(x + 62.54, y + 59.58) controlPoint1: CGPointMake(x + 75.59, y + 75.31) controlPoint2: CGPointMake(x + 73.5, y + 66.05)];
            [heartPath addCurveToPoint: CGPointMake(x + 35, y + 66) controlPoint1: CGPointMake(x + 51.15, y + 52.85) controlPoint2: CGPointMake(x + 38.45, y + 60.15)];
            [heartPath addCurveToPoint: CGPointMake(x + 45.86, y + 131.53) controlPoint1: CGPointMake(x + 21.17, y + 89.44) controlPoint2: CGPointMake(x + 32.03, y + 108.09)];
            [heartPath addCurveToPoint: CGPointMake(x + 75.58, y + 181) controlPoint1: CGPointMake(x + 52.77, y + 143.25) controlPoint2: CGPointMake(x + 75.58, y + 181)];
        } else {
            [heartPath moveToPoint: CGPointMake(x + 36.57, y + 87)];
            [heartPath addCurveToPoint: CGPointMake(x + 52.48, y + 65.03) controlPoint1: CGPointMake(x + 36.57, y + 87) controlPoint2: CGPointMake(x + 48.8, y + 70.24)];
            [heartPath addCurveToPoint: CGPointMake(x + 58.05, y + 35.93) controlPoint1: CGPointMake(x + 59.82, y + 54.62) controlPoint2: CGPointMake(x + 65.39, y + 46.34)];
            [heartPath addCurveToPoint: CGPointMake(x + 42.97, y + 33.08) controlPoint1: CGPointMake(x + 56.22, y + 33.34) controlPoint2: CGPointMake(x + 48.09, y + 30.25)];
            [heartPath addCurveToPoint: CGPointMake(x + 36.57, y + 40.07) controlPoint1: CGPointMake(x + 37.59, y + 36.05) controlPoint2: CGPointMake(x + 36.57, y + 40.07)];
            [heartPath addCurveToPoint: CGPointMake(x + 29.63, y + 33.08) controlPoint1: CGPointMake(x + 36.57, y + 40.07) controlPoint2: CGPointMake(x + 35.46, y + 35.95)];
            [heartPath addCurveToPoint: CGPointMake(x + 15, y + 35.93) controlPoint1: CGPointMake(x + 23.58, y + 30.09) controlPoint2: CGPointMake(x + 16.83, y + 33.33)];
            [heartPath addCurveToPoint: CGPointMake(x + 20.77, y + 65.03) controlPoint1: CGPointMake(x + 7.65, y + 46.34) controlPoint2: CGPointMake(x + 13.42, y + 54.62)];
            [heartPath addCurveToPoint: CGPointMake(x + 36.57, y + 87) controlPoint1: CGPointMake(x + 24.44, y + 70.24) controlPoint2: CGPointMake(x + 36.57, y + 87)];
        }
        [heartPath closePath];
        [fillColor setFill];
        [heartPath fill];
    } else if(suit == SUIT_DIAMOND) {
        UIBezierPath* diamondPath = [UIBezierPath bezierPath];
        if([RSGameView isPad]) {
            [diamondPath moveToPoint: CGPointMake(x + 75.5, y + 198.5)];
            [diamondPath addLineToPoint: CGPointMake(x + 119.5, y + 118.98)];
            [diamondPath addLineToPoint: CGPointMake(x + 75.5, y + 40.5)];
            [diamondPath addLineToPoint: CGPointMake(x + 31.5, y + 118.98)];
            [diamondPath addLineToPoint: CGPointMake(x + 75.5, y + 198.5)];
        } else {
            [diamondPath moveToPoint: CGPointMake(x + 38, y + 98.5)];
            [diamondPath addLineToPoint: CGPointMake(x + 58.5, y + 61.96)];
            [diamondPath addLineToPoint: CGPointMake(x + 38, y + 22.5)];
            [diamondPath addLineToPoint: CGPointMake(x + 17.5, y + 61.96)];
            [diamondPath addLineToPoint: CGPointMake(x + 38, y + 98.5)];
        }
        [fillColor setFill];
        [diamondPath fill];
    } else if(suit == SUIT_CLUB) {
        if([RSGameView isPad]) {
            UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
            [rectanglePath moveToPoint: CGPointMake(x + 61.5, y + 178.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 85.5, y + 178.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 75.9, y + 104.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 68.7, y + 104.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 61.5, y + 178.5)];
            [rectanglePath closePath];
            [color2 setFill];
            [rectanglePath fill];
            
            [[UIColor blackColor] setStroke];
            rectanglePath.lineWidth = 1;
            [rectanglePath stroke];
            
            UIBezierPath* cloverPath1 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 67, y + 95, 51, 51)];
            [color2 setFill];
            [cloverPath1 fill];
            
            UIBezierPath* cloverPath2 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 49, y + 54, 51, 51)];
            [color2 setFill];
            [cloverPath2 fill];
            
            UIBezierPath* cloverPath3 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 30, y + 95, 51, 51)];
            [color2 setFill];
            [cloverPath3 fill];
        } else {
            UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
            [rectanglePath moveToPoint: CGPointMake(x + 33.5, y + 88.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 39.5, y + 88.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 37.1, y + 46.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 35.3, y + 46.5)];
            [rectanglePath addLineToPoint: CGPointMake(x + 33.5, y + 88.5)];
            [rectanglePath closePath];
            [color2 setFill];
            [rectanglePath fill];
            CGContextRestoreGState(context);
            
            [[UIColor blackColor] setStroke];
            rectanglePath.lineWidth = 1;
            [rectanglePath stroke];
            
            UIBezierPath* cloverPath1 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 35, y + 51, 27, 27)];
            [color2 setFill];
            [cloverPath1 fill];
            CGContextRestoreGState(context);
            
            UIBezierPath* cloverPath2 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 23, y + 30, 27, 27)];
            [color2 setFill];
            [cloverPath2 fill];
            CGContextRestoreGState(context);

            UIBezierPath* cloverPath3 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 12, y + 51, 27, 27)];
            [color2 setFill];
            [cloverPath3 fill];
        }
    }
    CGContextRestoreGState(context);

    CGContextSaveGState(context);

    // Font styling for card numeration:
    NSMutableDictionary *strAttribs = [[NSMutableDictionary alloc] init];
    if(suit == SUIT_CLUB || suit == SUIT_SPADE) {
        [strAttribs setObject:color2 forKey:NSForegroundColorAttributeName];
    } else {
        [strAttribs setObject:fillColor forKey:NSForegroundColorAttributeName];
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    if([RSGameView isPad]) {
        [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: 34] forKey:NSFontAttributeName];
    } else {
        [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: [UIFont labelFontSize]] forKey:NSFontAttributeName];
    }
    [strAttribs setObject:style forKey:NSParagraphStyleAttributeName];
   
    

    // Upper Left Card # Drawing
    if([RSGameView isPad]) {
        CGRect upperLeftRect = CGRectMake(x + 12.5, y + 10.5, 43, 43);
        [card drawInRect:upperLeftRect withAttributes:strAttribs];
    } else {
        CGRect upperLeftRect = CGRectMake(x + 6.5, y + 6.5, 21, 19);
        [card drawInRect:upperLeftRect withAttributes:strAttribs];
    }
    
    // Lower Right Card # Drawing
    if([RSGameView isPad]) {
        CGRect lowerRightRect = CGRectMake(x + 92.5, y + 184.5, 43, 43);
        [card drawInRect:lowerRightRect withAttributes:strAttribs];
    } else {
        CGRect lowerRightRect = CGRectMake(x + 47.5, y + 91.5, 21, 19);
        [card drawInRect:lowerRightRect withAttributes:strAttribs];
    }
    
    CGContextRestoreGState(context);
    
    // Cleanup
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    
}

- (void) drawBackground {
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor* fillColor = [UIColor colorWithRed:0.243 green: 0.525 blue: 0.125 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.295 green: 0.365 blue: 0.195 alpha: 1];

    
    // Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)strokeColor.CGColor,
                               (id)fillColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    // Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(self.bounds.size.width / 2, 0.5), CGPointMake(self.bounds.size.width / 2, self.bounds.size.height), 0);
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    // Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void) drawWaitingDisplayatX: (float) x y: (float) y {
    // General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    CGRect textRect = CGRectMake(x + 34, y + 19, 136, 62);

    // Text we want to display
    NSString* textContent = @"Waiting for more players to join the game.";

    // Shadow Declarations
    UIColor* shadow = [UIColor blackColor];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 5;
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);

    // bounding box
    if([RSGameView isPad]) {
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 400, 200) cornerRadius: 8];
        [[UIColor whiteColor] setFill];
        [roundedRectanglePath fill];
        CGContextRestoreGState(context);

        [[UIColor blackColor] setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];

        
        // Overwrite the text rect for ipad only
        textRect = CGRectMake(x + 54, y + 37, 294, 124);
    } else {
        // bounding box
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 200, 100) cornerRadius: 4];
        [[UIColor whiteColor] setFill];
        [roundedRectanglePath fill];
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
    }

    // Font styling for waiting text:
    NSMutableDictionary *strAttribs = [[NSMutableDictionary alloc] init];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    if([RSGameView isPad]) {
        [strAttribs setObject:[UIFont fontWithName: @"Georgia-Italic" size: 34] forKey:NSFontAttributeName];
    } else {
        [strAttribs setObject:[UIFont fontWithName: @"Georgia-Italic" size: [UIFont labelFontSize]] forKey:NSFontAttributeName];
    }

    [strAttribs setObject:style forKey:NSParagraphStyleAttributeName];
    
    // Text Drawing
    [[UIColor blackColor] setFill];
    [textContent drawInRect:textRect withAttributes:strAttribs];
}

- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Game View: redrawing game view");
    [self drawBackground];
    
    float alpha = 0.15;
    // only draw players 3 + 4 if we are in a 4 player game
    if(totalPlayers == 4) {
        if(currentPlayers > 3)
            alpha = 1.0;
        if(horizontal) {
            if([RSGameView isPad]) {
                [self drawCardBackAtX:((self.bounds.size.width / 2) - 75) y:11 alpha:alpha];
                if(currentPlayers > 2)
                    alpha = 1.0;
                [self drawCardBackAtX:((self.bounds.size.width / 2) - 75) y:((self.bounds.size.height - 251)) alpha:alpha];
            } else {
                [self drawCardBackAtX:11 y:((self.bounds.size.height / 2) - 120) alpha:alpha];
                if(currentPlayers > 2)
                    alpha = 1.0;
                [self drawCardBackAtX:(self.bounds.size.width - 161) y:((self.bounds.size.height / 2) - 120) alpha:alpha];
            }
        } else {
            if([RSGameView isPad]) {
                [self drawCardBackAtX:11 y:((self.bounds.size.height / 2) - 120) alpha:alpha];
                if(currentPlayers > 2)
                    alpha = 1.0;
                [self drawCardBackAtX:(self.bounds.size.width - 161) y:((self.bounds.size.height / 2) - 120) alpha:alpha];
            } else {
                [self drawCardBackAtX:5.5 y:((self.bounds.size.height / 2) - 60) alpha:alpha];
                if(currentPlayers > 2)
                    alpha = 1.0;
                [self drawCardBackAtX:(self.bounds.size.width - 80.5) y:((self.bounds.size.height / 2) - 60) alpha:alpha];
            }
        }
    }
    
    // draw players 1 + 2 in all cases
    if(horizontal) {
        if([RSGameView isPad]) {
            if(currentPlayers > 1)
                alpha = 1.0;
            [self drawCardBackAtX:11 y:((self.bounds.size.height / 2) - 120) alpha:alpha];
            [self drawCardBackAtX:(self.bounds.size.width - 161) y:((self.bounds.size.height / 2) - 120) alpha:1];
        } else {
            if(currentPlayers > 1)
                alpha = 1.0;
            [self drawCardBackAtX:5.5 y:((self.bounds.size.height / 2) - 60) alpha:alpha];
            [self drawCardBackAtX:(self.bounds.size.width - 80.5) y:((self.bounds.size.height / 2) - 60) alpha:1];
        }
    } else {
        if([RSGameView isPad]) {
            if(currentPlayers > 1)
                alpha = 1.0;
            [self drawCardBackAtX:((self.bounds.size.width / 2) - 75) y:11 alpha:alpha];
            [self drawCardBackAtX:((self.bounds.size.width / 2) - 75) y:((self.bounds.size.height - 251)) alpha:1];
        } else {
            if(currentPlayers > 1)
                alpha = 1.0;
            [self drawCardBackAtX:((self.bounds.size.width / 2) - 37.5) y:5.5 alpha:alpha];
            [self drawCardBackAtX:((self.bounds.size.width / 2) - 37.5) y:((self.bounds.size.height - 125.5)) alpha:1];
        }
    }

    // If we're waiting, let's make sure the player knows
    if(stillWaiting) {
        if([RSGameView isPad]) {
            [self drawWaitingDisplayatX:self.bounds.size.width / 2 - 200 y:self.bounds.size.height / 2 - 100];
        } else {
            [self drawWaitingDisplayatX:self.bounds.size.width / 2 - 100 y:self.bounds.size.height / 2 - 50];
        }
    } else {
        // draw the card on top of the stack if we're not waiting!
        if([RSGameView isPad]) {
            [self drawCardAtX:((self.bounds.size.width / 2) - 75) y:self.bounds.size.height / 2 - 120 suit:SUIT_SPADE card:@"K"];
        } else {
            [self drawCardAtX:((self.bounds.size.width / 2) - 37.5) y:self.bounds.size.height / 2 - 60 suit:SUIT_SPADE card:@"K"];
        }

    }
}

- (void) setWaiting: (BOOL) waiting {
    NSLog(@"Game View: Changing whether or not we're waiting on players");
    stillWaiting = waiting;
    [self setNeedsDisplay];
}

- (void) setPlayers: (int) current total:(int) total {
    NSLog(@"Game View: changing number of players on the board");
    totalPlayers = total;
    currentPlayers = current;
    NSLog(@"We have %d current players",current);
    [self setNeedsDisplay];
}

- (void) setOrientationHorizontal: (BOOL) isHorizontal {
    NSLog(@"Game View: Setting orientation");
    horizontal = isHorizontal;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!stillWaiting) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        NSLog(@"Game View: TOUCH at (%f,%f)", point.x, point.y);
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Game View: System says NO TOUCHING");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!stillWaiting) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        NSLog(@"Game View: TOUCH RELEASE at (%f,%f)", point.x, point.y);
    }
}

@end
