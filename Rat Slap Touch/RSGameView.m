//
//  RSGameView.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameView.h"

@implementation RSGameView

- (void) gameViewInit {
    NSLog(@"Game View: Initializing (new game board)");
    return;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
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

- (void)drawCardBack {
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
    UIBezierPath* outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5.5, 5.5, 75, 120) cornerRadius: 4];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [outerCardPath addClip];
    CGContextDrawLinearGradient(context, gradient2, CGPointMake(-4.58, 17.92), CGPointMake(90.58, 113.08), 0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    outerCardPath.lineWidth = 1;
    [outerCardPath stroke];
    
    //// Inner Card Drawing
    UIBezierPath* innerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(10.5, 10.5, 64, 110) cornerRadius: 4];
    [color3 setFill];
    [innerCardPath fill];
    
    //// Star 1 Drawing
    UIBezierPath* star1Path = [UIBezierPath bezierPath];
    [star1Path moveToPoint: CGPointMake(18, 14.5)];
    [star1Path addLineToPoint: CGPointMake(20.65, 18.87)];
    [star1Path addLineToPoint: CGPointMake(25.13, 20.37)];
    [star1Path addLineToPoint: CGPointMake(22.28, 24.58)];
    [star1Path addLineToPoint: CGPointMake(22.41, 29.88)];
    [star1Path addLineToPoint: CGPointMake(18, 28.1)];
    [star1Path addLineToPoint: CGPointMake(13.59, 29.88)];
    [star1Path addLineToPoint: CGPointMake(13.72, 24.58)];
    [star1Path addLineToPoint: CGPointMake(10.87, 20.37)];
    [star1Path addLineToPoint: CGPointMake(15.35, 18.87)];
    [star1Path closePath];
    [[UIColor whiteColor] setFill];
    [star1Path fill];
    
    //// Star 2 Drawing
    UIBezierPath* star2Path = [UIBezierPath bezierPath];
    [star2Path moveToPoint: CGPointMake(35, 14.5)];
    [star2Path addLineToPoint: CGPointMake(37.65, 18.87)];
    [star2Path addLineToPoint: CGPointMake(42.13, 20.37)];
    [star2Path addLineToPoint: CGPointMake(39.28, 24.58)];
    [star2Path addLineToPoint: CGPointMake(39.41, 29.88)];
    [star2Path addLineToPoint: CGPointMake(35, 28.1)];
    [star2Path addLineToPoint: CGPointMake(30.59, 29.88)];
    [star2Path addLineToPoint: CGPointMake(30.72, 24.58)];
    [star2Path addLineToPoint: CGPointMake(27.87, 20.37)];
    [star2Path addLineToPoint: CGPointMake(32.35, 18.87)];
    [star2Path closePath];
    [[UIColor whiteColor] setFill];
    [star2Path fill];
    
    //// Star 3 Drawing
    UIBezierPath* star3Path = [UIBezierPath bezierPath];
    [star3Path moveToPoint: CGPointMake(51, 14.5)];
    [star3Path addLineToPoint: CGPointMake(53.65, 18.87)];
    [star3Path addLineToPoint: CGPointMake(58.13, 20.37)];
    [star3Path addLineToPoint: CGPointMake(55.28, 24.58)];
    [star3Path addLineToPoint: CGPointMake(55.41, 29.88)];
    [star3Path addLineToPoint: CGPointMake(51, 28.1)];
    [star3Path addLineToPoint: CGPointMake(46.59, 29.88)];
    [star3Path addLineToPoint: CGPointMake(46.72, 24.58)];
    [star3Path addLineToPoint: CGPointMake(43.87, 20.37)];
    [star3Path addLineToPoint: CGPointMake(48.35, 18.87)];
    [star3Path closePath];
    [[UIColor whiteColor] setFill];
    [star3Path fill];
    
    //// Star 4 Drawing
    UIBezierPath* star4Path = [UIBezierPath bezierPath];
    [star4Path moveToPoint: CGPointMake(67, 14.5)];
    [star4Path addLineToPoint: CGPointMake(69.65, 18.87)];
    [star4Path addLineToPoint: CGPointMake(74.13, 20.37)];
    [star4Path addLineToPoint: CGPointMake(71.28, 24.58)];
    [star4Path addLineToPoint: CGPointMake(71.41, 29.88)];
    [star4Path addLineToPoint: CGPointMake(67, 28.1)];
    [star4Path addLineToPoint: CGPointMake(62.59, 29.88)];
    [star4Path addLineToPoint: CGPointMake(62.72, 24.58)];
    [star4Path addLineToPoint: CGPointMake(59.87, 20.37)];
    [star4Path addLineToPoint: CGPointMake(64.35, 18.87)];
    [star4Path closePath];
    [[UIColor whiteColor] setFill];
    [star4Path fill];
    
    //// Star 5 Drawing
    UIBezierPath* star5Path = [UIBezierPath bezierPath];
    [star5Path moveToPoint: CGPointMake(18, 31.5)];
    [star5Path addLineToPoint: CGPointMake(20.65, 35.87)];
    [star5Path addLineToPoint: CGPointMake(25.13, 37.37)];
    [star5Path addLineToPoint: CGPointMake(22.28, 41.58)];
    [star5Path addLineToPoint: CGPointMake(22.41, 46.88)];
    [star5Path addLineToPoint: CGPointMake(18, 45.1)];
    [star5Path addLineToPoint: CGPointMake(13.59, 46.88)];
    [star5Path addLineToPoint: CGPointMake(13.72, 41.58)];
    [star5Path addLineToPoint: CGPointMake(10.87, 37.37)];
    [star5Path addLineToPoint: CGPointMake(15.35, 35.87)];
    [star5Path closePath];
    [[UIColor whiteColor] setFill];
    [star5Path fill];
    
    //// Star 6 Drawing
    UIBezierPath* star6Path = [UIBezierPath bezierPath];
    [star6Path moveToPoint: CGPointMake(35, 31.5)];
    [star6Path addLineToPoint: CGPointMake(37.65, 35.87)];
    [star6Path addLineToPoint: CGPointMake(42.13, 37.37)];
    [star6Path addLineToPoint: CGPointMake(39.28, 41.58)];
    [star6Path addLineToPoint: CGPointMake(39.41, 46.88)];
    [star6Path addLineToPoint: CGPointMake(35, 45.1)];
    [star6Path addLineToPoint: CGPointMake(30.59, 46.88)];
    [star6Path addLineToPoint: CGPointMake(30.72, 41.58)];
    [star6Path addLineToPoint: CGPointMake(27.87, 37.37)];
    [star6Path addLineToPoint: CGPointMake(32.35, 35.87)];
    [star6Path closePath];
    [[UIColor whiteColor] setFill];
    [star6Path fill];
    
    //// Star 7 Drawing
    UIBezierPath* star7Path = [UIBezierPath bezierPath];
    [star7Path moveToPoint: CGPointMake(51, 31.5)];
    [star7Path addLineToPoint: CGPointMake(53.65, 35.87)];
    [star7Path addLineToPoint: CGPointMake(58.13, 37.37)];
    [star7Path addLineToPoint: CGPointMake(55.28, 41.58)];
    [star7Path addLineToPoint: CGPointMake(55.41, 46.88)];
    [star7Path addLineToPoint: CGPointMake(51, 45.1)];
    [star7Path addLineToPoint: CGPointMake(46.59, 46.88)];
    [star7Path addLineToPoint: CGPointMake(46.72, 41.58)];
    [star7Path addLineToPoint: CGPointMake(43.87, 37.37)];
    [star7Path addLineToPoint: CGPointMake(48.35, 35.87)];
    [star7Path closePath];
    [[UIColor whiteColor] setFill];
    [star7Path fill];
    
    //// Star 8 Drawing
    UIBezierPath* star8Path = [UIBezierPath bezierPath];
    [star8Path moveToPoint: CGPointMake(67, 31.5)];
    [star8Path addLineToPoint: CGPointMake(69.65, 35.87)];
    [star8Path addLineToPoint: CGPointMake(74.13, 37.37)];
    [star8Path addLineToPoint: CGPointMake(71.28, 41.58)];
    [star8Path addLineToPoint: CGPointMake(71.41, 46.88)];
    [star8Path addLineToPoint: CGPointMake(67, 45.1)];
    [star8Path addLineToPoint: CGPointMake(62.59, 46.88)];
    [star8Path addLineToPoint: CGPointMake(62.72, 41.58)];
    [star8Path addLineToPoint: CGPointMake(59.87, 37.37)];
    [star8Path addLineToPoint: CGPointMake(64.35, 35.87)];
    [star8Path closePath];
    [[UIColor whiteColor] setFill];
    [star8Path fill];
    
    //// Star 9 Drawing
    UIBezierPath* star9Path = [UIBezierPath bezierPath];
    [star9Path moveToPoint: CGPointMake(18, 48.5)];
    [star9Path addLineToPoint: CGPointMake(20.65, 52.87)];
    [star9Path addLineToPoint: CGPointMake(25.13, 54.37)];
    [star9Path addLineToPoint: CGPointMake(22.28, 58.58)];
    [star9Path addLineToPoint: CGPointMake(22.41, 63.88)];
    [star9Path addLineToPoint: CGPointMake(18, 62.1)];
    [star9Path addLineToPoint: CGPointMake(13.59, 63.88)];
    [star9Path addLineToPoint: CGPointMake(13.72, 58.58)];
    [star9Path addLineToPoint: CGPointMake(10.87, 54.37)];
    [star9Path addLineToPoint: CGPointMake(15.35, 52.87)];
    [star9Path closePath];
    [[UIColor whiteColor] setFill];
    [star9Path fill];
    
    //// Star 10 Drawing
    UIBezierPath* star10Path = [UIBezierPath bezierPath];
    [star10Path moveToPoint: CGPointMake(35, 48.5)];
    [star10Path addLineToPoint: CGPointMake(37.65, 52.87)];
    [star10Path addLineToPoint: CGPointMake(42.13, 54.37)];
    [star10Path addLineToPoint: CGPointMake(39.28, 58.58)];
    [star10Path addLineToPoint: CGPointMake(39.41, 63.88)];
    [star10Path addLineToPoint: CGPointMake(35, 62.1)];
    [star10Path addLineToPoint: CGPointMake(30.59, 63.88)];
    [star10Path addLineToPoint: CGPointMake(30.72, 58.58)];
    [star10Path addLineToPoint: CGPointMake(27.87, 54.37)];
    [star10Path addLineToPoint: CGPointMake(32.35, 52.87)];
    [star10Path closePath];
    [[UIColor whiteColor] setFill];
    [star10Path fill];
    
    //// Star 11 Drawing
    UIBezierPath* star11Path = [UIBezierPath bezierPath];
    [star11Path moveToPoint: CGPointMake(51, 48.5)];
    [star11Path addLineToPoint: CGPointMake(53.65, 52.87)];
    [star11Path addLineToPoint: CGPointMake(58.13, 54.37)];
    [star11Path addLineToPoint: CGPointMake(55.28, 58.58)];
    [star11Path addLineToPoint: CGPointMake(55.41, 63.88)];
    [star11Path addLineToPoint: CGPointMake(51, 62.1)];
    [star11Path addLineToPoint: CGPointMake(46.59, 63.88)];
    [star11Path addLineToPoint: CGPointMake(46.72, 58.58)];
    [star11Path addLineToPoint: CGPointMake(43.87, 54.37)];
    [star11Path addLineToPoint: CGPointMake(48.35, 52.87)];
    [star11Path closePath];
    [[UIColor whiteColor] setFill];
    [star11Path fill];
    
    //// Star 12 Drawing
    UIBezierPath* star12Path = [UIBezierPath bezierPath];
    [star12Path moveToPoint: CGPointMake(67, 48.5)];
    [star12Path addLineToPoint: CGPointMake(69.65, 52.87)];
    [star12Path addLineToPoint: CGPointMake(74.13, 54.37)];
    [star12Path addLineToPoint: CGPointMake(71.28, 58.58)];
    [star12Path addLineToPoint: CGPointMake(71.41, 63.88)];
    [star12Path addLineToPoint: CGPointMake(67, 62.1)];
    [star12Path addLineToPoint: CGPointMake(62.59, 63.88)];
    [star12Path addLineToPoint: CGPointMake(62.72, 58.58)];
    [star12Path addLineToPoint: CGPointMake(59.87, 54.37)];
    [star12Path addLineToPoint: CGPointMake(64.35, 52.87)];
    [star12Path closePath];
    [[UIColor whiteColor] setFill];
    [star12Path fill];
    
    //// Star 13 Drawing
    UIBezierPath* star13Path = [UIBezierPath bezierPath];
    [star13Path moveToPoint: CGPointMake(18, 65.5)];
    [star13Path addLineToPoint: CGPointMake(20.65, 69.87)];
    [star13Path addLineToPoint: CGPointMake(25.13, 71.37)];
    [star13Path addLineToPoint: CGPointMake(22.28, 75.58)];
    [star13Path addLineToPoint: CGPointMake(22.41, 80.88)];
    [star13Path addLineToPoint: CGPointMake(18, 79.1)];
    [star13Path addLineToPoint: CGPointMake(13.59, 80.88)];
    [star13Path addLineToPoint: CGPointMake(13.72, 75.58)];
    [star13Path addLineToPoint: CGPointMake(10.87, 71.37)];
    [star13Path addLineToPoint: CGPointMake(15.35, 69.87)];
    [star13Path closePath];
    [[UIColor whiteColor] setFill];
    [star13Path fill];
    
    //// Star 14 Drawing
    UIBezierPath* star14Path = [UIBezierPath bezierPath];
    [star14Path moveToPoint: CGPointMake(35, 65.5)];
    [star14Path addLineToPoint: CGPointMake(37.65, 69.87)];
    [star14Path addLineToPoint: CGPointMake(42.13, 71.37)];
    [star14Path addLineToPoint: CGPointMake(39.28, 75.58)];
    [star14Path addLineToPoint: CGPointMake(39.41, 80.88)];
    [star14Path addLineToPoint: CGPointMake(35, 79.1)];
    [star14Path addLineToPoint: CGPointMake(30.59, 80.88)];
    [star14Path addLineToPoint: CGPointMake(30.72, 75.58)];
    [star14Path addLineToPoint: CGPointMake(27.87, 71.37)];
    [star14Path addLineToPoint: CGPointMake(32.35, 69.87)];
    [star14Path closePath];
    [[UIColor whiteColor] setFill];
    [star14Path fill];
    
    //// Star 15 Drawing
    UIBezierPath* star15Path = [UIBezierPath bezierPath];
    [star15Path moveToPoint: CGPointMake(51, 65.5)];
    [star15Path addLineToPoint: CGPointMake(53.65, 69.87)];
    [star15Path addLineToPoint: CGPointMake(58.13, 71.37)];
    [star15Path addLineToPoint: CGPointMake(55.28, 75.58)];
    [star15Path addLineToPoint: CGPointMake(55.41, 80.88)];
    [star15Path addLineToPoint: CGPointMake(51, 79.1)];
    [star15Path addLineToPoint: CGPointMake(46.59, 80.88)];
    [star15Path addLineToPoint: CGPointMake(46.72, 75.58)];
    [star15Path addLineToPoint: CGPointMake(43.87, 71.37)];
    [star15Path addLineToPoint: CGPointMake(48.35, 69.87)];
    [star15Path closePath];
    [[UIColor whiteColor] setFill];
    [star15Path fill];
    
    //// Star 16 Drawing
    UIBezierPath* star16Path = [UIBezierPath bezierPath];
    [star16Path moveToPoint: CGPointMake(67, 65.5)];
    [star16Path addLineToPoint: CGPointMake(69.65, 69.87)];
    [star16Path addLineToPoint: CGPointMake(74.13, 71.37)];
    [star16Path addLineToPoint: CGPointMake(71.28, 75.58)];
    [star16Path addLineToPoint: CGPointMake(71.41, 80.88)];
    [star16Path addLineToPoint: CGPointMake(67, 79.1)];
    [star16Path addLineToPoint: CGPointMake(62.59, 80.88)];
    [star16Path addLineToPoint: CGPointMake(62.72, 75.58)];
    [star16Path addLineToPoint: CGPointMake(59.87, 71.37)];
    [star16Path addLineToPoint: CGPointMake(64.35, 69.87)];
    [star16Path closePath];
    [[UIColor whiteColor] setFill];
    [star16Path fill];
    
    //// Star 17 Drawing
    UIBezierPath* star17Path = [UIBezierPath bezierPath];
    [star17Path moveToPoint: CGPointMake(18, 82.5)];
    [star17Path addLineToPoint: CGPointMake(20.65, 86.87)];
    [star17Path addLineToPoint: CGPointMake(25.13, 88.37)];
    [star17Path addLineToPoint: CGPointMake(22.28, 92.58)];
    [star17Path addLineToPoint: CGPointMake(22.41, 97.88)];
    [star17Path addLineToPoint: CGPointMake(18, 96.1)];
    [star17Path addLineToPoint: CGPointMake(13.59, 97.88)];
    [star17Path addLineToPoint: CGPointMake(13.72, 92.58)];
    [star17Path addLineToPoint: CGPointMake(10.87, 88.37)];
    [star17Path addLineToPoint: CGPointMake(15.35, 86.87)];
    [star17Path closePath];
    [[UIColor whiteColor] setFill];
    [star17Path fill];
    
    //// Star 18 Drawing
    UIBezierPath* star18Path = [UIBezierPath bezierPath];
    [star18Path moveToPoint: CGPointMake(35, 82.5)];
    [star18Path addLineToPoint: CGPointMake(37.65, 86.87)];
    [star18Path addLineToPoint: CGPointMake(42.13, 88.37)];
    [star18Path addLineToPoint: CGPointMake(39.28, 92.58)];
    [star18Path addLineToPoint: CGPointMake(39.41, 97.88)];
    [star18Path addLineToPoint: CGPointMake(35, 96.1)];
    [star18Path addLineToPoint: CGPointMake(30.59, 97.88)];
    [star18Path addLineToPoint: CGPointMake(30.72, 92.58)];
    [star18Path addLineToPoint: CGPointMake(27.87, 88.37)];
    [star18Path addLineToPoint: CGPointMake(32.35, 86.87)];
    [star18Path closePath];
    [[UIColor whiteColor] setFill];
    [star18Path fill];
    
    //// Star 19 Drawing
    UIBezierPath* star19Path = [UIBezierPath bezierPath];
    [star19Path moveToPoint: CGPointMake(51, 82.5)];
    [star19Path addLineToPoint: CGPointMake(53.65, 86.87)];
    [star19Path addLineToPoint: CGPointMake(58.13, 88.37)];
    [star19Path addLineToPoint: CGPointMake(55.28, 92.58)];
    [star19Path addLineToPoint: CGPointMake(55.41, 97.88)];
    [star19Path addLineToPoint: CGPointMake(51, 96.1)];
    [star19Path addLineToPoint: CGPointMake(46.59, 97.88)];
    [star19Path addLineToPoint: CGPointMake(46.72, 92.58)];
    [star19Path addLineToPoint: CGPointMake(43.87, 88.37)];
    [star19Path addLineToPoint: CGPointMake(48.35, 86.87)];
    [star19Path closePath];
    [[UIColor whiteColor] setFill];
    [star19Path fill];
    
    //// Star 20 Drawing
    UIBezierPath* star20Path = [UIBezierPath bezierPath];
    [star20Path moveToPoint: CGPointMake(67, 82.5)];
    [star20Path addLineToPoint: CGPointMake(69.65, 86.87)];
    [star20Path addLineToPoint: CGPointMake(74.13, 88.37)];
    [star20Path addLineToPoint: CGPointMake(71.28, 92.58)];
    [star20Path addLineToPoint: CGPointMake(71.41, 97.88)];
    [star20Path addLineToPoint: CGPointMake(67, 96.1)];
    [star20Path addLineToPoint: CGPointMake(62.59, 97.88)];
    [star20Path addLineToPoint: CGPointMake(62.72, 92.58)];
    [star20Path addLineToPoint: CGPointMake(59.87, 88.37)];
    [star20Path addLineToPoint: CGPointMake(64.35, 86.87)];
    [star20Path closePath];
    [[UIColor whiteColor] setFill];
    [star20Path fill];
    
    //// Star 21 Drawing
    UIBezierPath* star21Path = [UIBezierPath bezierPath];
    [star21Path moveToPoint: CGPointMake(18, 99.5)];
    [star21Path addLineToPoint: CGPointMake(20.65, 103.87)];
    [star21Path addLineToPoint: CGPointMake(25.13, 105.37)];
    [star21Path addLineToPoint: CGPointMake(22.28, 109.58)];
    [star21Path addLineToPoint: CGPointMake(22.41, 114.88)];
    [star21Path addLineToPoint: CGPointMake(18, 113.1)];
    [star21Path addLineToPoint: CGPointMake(13.59, 114.88)];
    [star21Path addLineToPoint: CGPointMake(13.72, 109.58)];
    [star21Path addLineToPoint: CGPointMake(10.87, 105.37)];
    [star21Path addLineToPoint: CGPointMake(15.35, 103.87)];
    [star21Path closePath];
    [[UIColor whiteColor] setFill];
    [star21Path fill];
    
    //// Star 22 Drawing
    UIBezierPath* star22Path = [UIBezierPath bezierPath];
    [star22Path moveToPoint: CGPointMake(35, 99.5)];
    [star22Path addLineToPoint: CGPointMake(37.65, 103.87)];
    [star22Path addLineToPoint: CGPointMake(42.13, 105.37)];
    [star22Path addLineToPoint: CGPointMake(39.28, 109.58)];
    [star22Path addLineToPoint: CGPointMake(39.41, 114.88)];
    [star22Path addLineToPoint: CGPointMake(35, 113.1)];
    [star22Path addLineToPoint: CGPointMake(30.59, 114.88)];
    [star22Path addLineToPoint: CGPointMake(30.72, 109.58)];
    [star22Path addLineToPoint: CGPointMake(27.87, 105.37)];
    [star22Path addLineToPoint: CGPointMake(32.35, 103.87)];
    [star22Path closePath];
    [[UIColor whiteColor] setFill];
    [star22Path fill];
    
    //// Star 23 Drawing
    UIBezierPath* star23Path = [UIBezierPath bezierPath];
    [star23Path moveToPoint: CGPointMake(51, 99.5)];
    [star23Path addLineToPoint: CGPointMake(53.65, 103.87)];
    [star23Path addLineToPoint: CGPointMake(58.13, 105.37)];
    [star23Path addLineToPoint: CGPointMake(55.28, 109.58)];
    [star23Path addLineToPoint: CGPointMake(55.41, 114.88)];
    [star23Path addLineToPoint: CGPointMake(51, 113.1)];
    [star23Path addLineToPoint: CGPointMake(46.59, 114.88)];
    [star23Path addLineToPoint: CGPointMake(46.72, 109.58)];
    [star23Path addLineToPoint: CGPointMake(43.87, 105.37)];
    [star23Path addLineToPoint: CGPointMake(48.35, 103.87)];
    [star23Path closePath];
    [[UIColor whiteColor] setFill];
    [star23Path fill];
    
    //// Star 24 Drawing
    UIBezierPath* star24Path = [UIBezierPath bezierPath];
    [star24Path moveToPoint: CGPointMake(67, 99.5)];
    [star24Path addLineToPoint: CGPointMake(69.65, 103.87)];
    [star24Path addLineToPoint: CGPointMake(74.13, 105.37)];
    [star24Path addLineToPoint: CGPointMake(71.28, 109.58)];
    [star24Path addLineToPoint: CGPointMake(71.41, 114.88)];
    [star24Path addLineToPoint: CGPointMake(67, 113.1)];
    [star24Path addLineToPoint: CGPointMake(62.59, 114.88)];
    [star24Path addLineToPoint: CGPointMake(62.72, 109.58)];
    [star24Path addLineToPoint: CGPointMake(59.87, 105.37)];
    [star24Path addLineToPoint: CGPointMake(64.35, 103.87)];
    [star24Path closePath];
    [[UIColor whiteColor] setFill];
    [star24Path fill];
    
    //// Cleanup
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
    [self drawCardBack];
    [self drawCardAtX:100 y:5.5 suit:SUIT_SPADE card:@"3"];
    [self drawCardAtX:190 y:5.5 suit:SUIT_HEART card:@"K"];
    [self drawCardAtX:100 y:135 suit:SUIT_CLUB card:@"J"];
    [self drawCardAtX:190 y:135 suit:SUIT_DIAMOND card:@"7"];
    
}

@end
