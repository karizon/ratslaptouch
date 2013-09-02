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

- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Game View: redrawing game view");
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.644 green: 0.078 blue: 0.078 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.465 green: 0.195 blue: 0.195 alpha: 1];
    
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

@end
