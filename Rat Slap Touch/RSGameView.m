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

- (void) drawStarAtX: (float) x y: (float) y {
    // Draw Star w/ first point @ x,y
    UIBezierPath* star1Path = [UIBezierPath bezierPath];
    [star1Path moveToPoint: CGPointMake(x, y)];
    [star1Path addLineToPoint: CGPointMake(x + 2.65, y + 4.37)];
    [star1Path addLineToPoint: CGPointMake(x + 7.13, y + 5.87)];
    [star1Path addLineToPoint: CGPointMake(x + 4.28, y + 10.08)];
    [star1Path addLineToPoint: CGPointMake(x + 4.41, y + 15.38)];
    [star1Path addLineToPoint: CGPointMake(x, y + 13.6)];
    [star1Path addLineToPoint: CGPointMake(x - 4.41, y + 15.38)];
    [star1Path addLineToPoint: CGPointMake(x - 4.28, y + 10.08)];
    [star1Path addLineToPoint: CGPointMake(x - 7.13, y + 5.87)];
    [star1Path addLineToPoint: CGPointMake(x - 2.65, y + 4.37)];
    [star1Path closePath];
    [[UIColor whiteColor] setFill];
    [star1Path fill];
}

- (void) drawCardBackAtX: (float) x y: (float) y {
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor* color2 =  [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    UIColor* color3 =  [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 0.3];
    
    //// Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    //// Outer Card Drawing
    UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 75, 120) cornerRadius: 4];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [outerCardPath addClip];
    CGContextDrawLinearGradient(context, gradient2, CGPointMake(x - 10, y + 12), CGPointMake(x + 85, y + 110), 0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    outerCardPath.lineWidth = 1;
    [outerCardPath stroke];
    
    //// Inner Card Drawing
    UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 5, y + 5, 64, 110) cornerRadius: 4];
    [color3 setFill];
    [innerCardPath fill];
    
    // Draw star card backs
    for(float x2 = (x + 11); x2 < (x + 75); x2 += 17) {
        for(float y2 = (y + 9); y2 < (y + 100); y2 += 17) {
            [self drawStarAtX:x2 y:y2];
        }
    }

    // Cleanup
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);

}

- (void) drawCardAtX: (float) x y:(float) y suit:(int) suit card:(NSString *) card {
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.644 green: 0.078 blue: 0.078 alpha: 1];
    UIColor* gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* gradient2Color2 = [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)gradient2Color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    //// Outer Card Drawing
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
    
    //// Inner Card Drawing
    UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x + 5, y + 5, 65, 110) cornerRadius: 4];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [[UIColor whiteColor] setFill];
    [innerCardPath fill];
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    innerCardPath.lineWidth = 1;
    [innerCardPath stroke];
    
    if(suit == SUIT_SPADE) {
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];

        [ovalPath moveToPoint: CGPointMake(x + 30.42, y + 72.99)];
        [ovalPath addCurveToPoint: CGPointMake(x + 34.47, y + 79.52) controlPoint1: CGPointMake(x + 31.22, y + 72.47) controlPoint2: CGPointMake(x + 34.67, y + 75.98)];
        [ovalPath addCurveToPoint: CGPointMake(x + 30.42, y + 86.5) controlPoint1: CGPointMake(x + 34.27, y + 83) controlPoint2: CGPointMake(x + 30.42, y + 86.5)];
        [ovalPath addLineToPoint: CGPointMake(x + 38.51, y + 86.5)];
        [ovalPath addLineToPoint: CGPointMake(x + 44.58, y + 86.5)];
        [ovalPath addCurveToPoint: CGPointMake(x + 40.53, y + 79.52) controlPoint1: CGPointMake(x + 44.58, y + 86.5) controlPoint2: CGPointMake(x + 40.72, y + 82.73)];
        [ovalPath addCurveToPoint: CGPointMake(x + 44.58, y + 72.99) controlPoint1: CGPointMake(x + 40.31, y + 75.76) controlPoint2: CGPointMake(x + 43.8, y + 72.5)];
        [ovalPath addCurveToPoint: CGPointMake(x + 56.71, y + 72.99) controlPoint1: CGPointMake(x + 48.74, y + 75.6) controlPoint2: CGPointMake(x + 53.95, y + 76.13)];
        [ovalPath addCurveToPoint: CGPointMake(x + 44.93, y + 40.72) controlPoint1: CGPointMake(x + 66.25, y + 62.14) controlPoint2: CGPointMake(x + 54.47, y + 51.56)];
        [ovalPath addCurveToPoint: CGPointMake(x + 30.07, y + 40.72) controlPoint1: CGPointMake(x + 35.39, y + 29.87) controlPoint2: CGPointMake(x + 39.61, y + 29.87)];
        [ovalPath addCurveToPoint: CGPointMake(x + 18.29, y + 72.99) controlPoint1: CGPointMake(x + 20.53, y + 51.56) controlPoint2: CGPointMake(x + 8.75, y + 62.14)];
        [ovalPath addCurveToPoint: CGPointMake(x + 30.42, y + 72.99) controlPoint1: CGPointMake(x + 21.28, y + 76.39) controlPoint2: CGPointMake(x + 26.46, y + 75.58)];
        [ovalPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [ovalPath fill];
        CGContextRestoreGState(context);
    } else if(suit == SUIT_HEART) {
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath moveToPoint: CGPointMake(x + 37.95, y + 86.5)];
        [ovalPath addCurveToPoint: CGPointMake(x + 53.5, y + 65.68) controlPoint1: CGPointMake(x + 37.95, y + 86.5) controlPoint2: CGPointMake(x + 49.91, y + 70.61)];
        [ovalPath addCurveToPoint: CGPointMake(x + 57.5, y + 35.46) controlPoint1: CGPointMake(x + 60.68, y + 55.81) controlPoint2: CGPointMake(x + 64.68, y + 45.33)];
        [ovalPath addCurveToPoint: CGPointMake(x + 42.13, y + 35.39) controlPoint1: CGPointMake(x + 55.71, y + 33.01) controlPoint2: CGPointMake(x + 45.58, y + 32.71)];
        [ovalPath addCurveToPoint: CGPointMake(x + 37.95, y + 43.91) controlPoint1: CGPointMake(x + 38.51, y + 38.2) controlPoint2: CGPointMake(x + 37.95, y + 43.91)];
        [ovalPath addCurveToPoint: CGPointMake(x + 33.77, y + 35.39) controlPoint1: CGPointMake(x + 37.95, y + 43.91) controlPoint2: CGPointMake(x + 37.21, y + 38.11)];
        [ovalPath addCurveToPoint: CGPointMake(x + 17.5, y + 35.46) controlPoint1: CGPointMake(x + 30.19, y + 32.56) controlPoint2: CGPointMake(x + 19.29, y + 33)];
        [ovalPath addCurveToPoint: CGPointMake(x + 22.5, y + 65.68) controlPoint1: CGPointMake(x + 10.32, y + 45.33) controlPoint2: CGPointMake(x + 15.32, y + 55.81)];
        [ovalPath addCurveToPoint: CGPointMake(x + 37.95, y + 86.5) controlPoint1: CGPointMake(x + 26.09, y + 70.61) controlPoint2: CGPointMake(x + 37.95, y + 86.5)];
        [ovalPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [fillColor setFill];
        [ovalPath fill];
        CGContextRestoreGState(context);
    } else if(suit == SUIT_DIAMOND) {
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath moveToPoint: CGPointMake(x + 38, y + 87)];
        [ovalPath addLineToPoint: CGPointMake(x + 53, y + 61.52)];
        [ovalPath addLineToPoint: CGPointMake(x + 38, y + 34)];
        [ovalPath addLineToPoint: CGPointMake(x + 23, y + 61.52)];
        [ovalPath addLineToPoint: CGPointMake(x + 38, y + 87)];
        [ovalPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [fillColor setFill];
        [ovalPath fill];
        CGContextRestoreGState(context);
    } else if(suit == SUIT_CLUB) {
        UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 36.5, y + 46.5, 20, 20)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [oval5Path fill];
        CGContextRestoreGState(context);

        UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 20.5, y + 46.5, 18, 20)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [oval6Path fill];
        CGContextRestoreGState(context);

        UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x + 29, y + 30.5, 18, 20)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [oval4Path fill];
        CGContextRestoreGState(context);

        UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
        [rectanglePath moveToPoint: CGPointMake(x + 33, y + 79)];
        [rectanglePath addLineToPoint: CGPointMake(x + 43, y + 79)];
        [rectanglePath addLineToPoint: CGPointMake(x + 39, y + 48)];
        [rectanglePath addLineToPoint: CGPointMake(x + 36, y + 48)];
        [rectanglePath addLineToPoint: CGPointMake(x + 33, y + 79)];
        [rectanglePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [rectanglePath fill];
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        rectanglePath.lineWidth = 1;
        [rectanglePath stroke];
    }

    // Upper Left Card # Drawing
    CGRect upperLeftRect = CGRectMake(x + 6.5, y + 6.5, 21, 19);
    CGContextSaveGState(context);
    NSMutableDictionary *strAttribs = [[NSMutableDictionary alloc] init];
    if(suit == SUIT_CLUB || suit == SUIT_SPADE) {
        [strAttribs setObject:color2 forKey:NSForegroundColorAttributeName];
    } else {
        [strAttribs setObject:fillColor forKey:NSForegroundColorAttributeName];
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: [UIFont labelFontSize]] forKey:NSFontAttributeName];
    [strAttribs setObject:style forKey:NSParagraphStyleAttributeName];
    [card drawInRect:upperLeftRect withAttributes:strAttribs];
    
    CGContextRestoreGState(context);
    
    //// Lower Right Card # Drawing
    CGRect lowerRightRect = CGRectMake(x + 47.5, y + 91.5, 21, 19);
    CGContextSaveGState(context);

    [card drawInRect:lowerRightRect withAttributes:strAttribs];
    CGContextRestoreGState(context);
    
    //// Cleanup
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

- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Game View: redrawing game view");
    [self drawBackground];
    [self drawCardBackAtX:5.5 y:5.5];
    [self drawCardBackAtX:5.5 y:135];
    [self drawCardAtX:100 y:5.5 suit:SUIT_SPADE card:@"3"];
    [self drawCardAtX:190 y:5.5 suit:SUIT_HEART card:@"K"];
    [self drawCardAtX:100 y:135 suit:SUIT_CLUB card:@"J"];
    [self drawCardAtX:190 y:135 suit:SUIT_DIAMOND card:@"7"];
    
}

@end
