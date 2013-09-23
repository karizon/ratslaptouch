//
//  RSGameView.m
//  Rat Slap Touch
//
//  Created by mandrake on 8/25/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameView.h"
#import "RSVisibleCard.h"
#import "RSCardSuits.h"

@implementation RSGameView


+ (BOOL) isPad {
#ifdef UI_USER_INTERFACE_IDIOM
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#endif
    return NO;
}

- (void) gameViewInit {
    stillWaiting = YES;
    totalPlayers = 0;
    currentPlayers = 0;
    visibleStackedCards = [NSMutableArray array];
    visiblePlayedCards = [NSMutableArray array];
    maxStackVisible = 3;
    maxPlayedVisible = 4;
    myPosition = 0;
    touchPending = NO;
    touchedCard = nil;
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

- (void) drawStarAt:(CGPoint) point alpha: (float) alpha {
    // Draw Star w/ first point @ x,y
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    if([RSGameView isPad]) {
        [starPath moveToPoint: CGPointMake(point.x, point.y)];
        [starPath addLineToPoint: CGPointMake(point.x + 5.82, point.y + 9.01)];
        [starPath addLineToPoint: CGPointMake(point.x + 15.69, point.y + 12.09)];
        [starPath addLineToPoint: CGPointMake(point.x + 9.42, point.y + 20.74)];
        [starPath addLineToPoint: CGPointMake(point.x + 9.7, point.y + 31.66)];
        [starPath addLineToPoint: CGPointMake(point.x + 0, point.y + 28)];
        [starPath addLineToPoint: CGPointMake(point.x - 9.7, point.y + 31.66)];
        [starPath addLineToPoint: CGPointMake(point.x - 9.42, point.y + 20.74)];
        [starPath addLineToPoint: CGPointMake(point.x - 15.69, point.y + 12.09)];
        [starPath addLineToPoint: CGPointMake(point.x - 5.82, point.y + 9.01)];
        [starPath addLineToPoint: CGPointMake(point.x , point.y)];
        [[UIColor blackColor] setStroke];
        starPath.lineWidth = 1;
        [starPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    } else {
        [starPath moveToPoint: CGPointMake(point.x, point.y)];
        [starPath addLineToPoint: CGPointMake(point.x + 2.65, point.y + 4.37)];
        [starPath addLineToPoint: CGPointMake(point.x + 7.13, point.y + 5.87)];
        [starPath addLineToPoint: CGPointMake(point.x + 4.28, point.y + 10.08)];
        [starPath addLineToPoint: CGPointMake(point.x + 4.41, point.y + 15.38)];
        [starPath addLineToPoint: CGPointMake(point.x, point.y + 13.6)];
        [starPath addLineToPoint: CGPointMake(point.x - 4.41, point.y + 15.38)];
        [starPath addLineToPoint: CGPointMake(point.x - 4.28, point.y + 10.08)];
        [starPath addLineToPoint: CGPointMake(point.x - 7.13, point.y + 5.87)];
        [starPath addLineToPoint: CGPointMake(point.x - 2.65, point.y + 4.37)];
        [starPath addLineToPoint: CGPointMake(point.x , point.y)];
        [[UIColor blackColor] setStroke];
        starPath.lineWidth = 1;
        [starPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    }
    [starPath closePath];
    [[UIColor whiteColor] setFill];
    [starPath fillWithBlendMode:kCGBlendModeNormal alpha:alpha];
}

- (void) drawCardBackAt:(CGPoint) point alpha:(float) alpha vertical:(BOOL) vertical {
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor *gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor *color2 =  [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    UIColor *color3 =  [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 0.3];
    
    // Gradient Declarations
    NSArray *gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors,
                                                         gradient2Locations);
    
    // Shadow Declarations
    UIColor *shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    // Outer Card Drawing
    UIBezierPath *outerCardPath;
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    CGContextSetAlpha(context,alpha);
    if([RSGameView isPad]) {
        if(vertical)
            outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 150, 240)
                                                       cornerRadius: 8];
        else
            outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 240, 150)
                                                       cornerRadius: 8];

        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(point.x - 20, point.y + 24),
                                    CGPointMake(point.x + 170, point.y + 220), 0);
    } else {
        if(vertical)
            outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 75, 120)
                                                       cornerRadius: 4];
        else
            outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 120, 75)
                                                       cornerRadius: 4];
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(point.x - 10, point.y + 12),
                                    CGPointMake(point.x + 85, point.y + 110), 0);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    outerCardPath.lineWidth = 1;
    [outerCardPath strokeWithBlendMode:kCGBlendModeNormal alpha:alpha];
    
    // Inner Card Drawing
    UIBezierPath *innerCardPath;
    if([RSGameView isPad]) {
        if(vertical)
            innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                             CGRectMake(point.x + 10, point.y + 10, 128, 220)
                                                       cornerRadius: 8];
        else
            innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                             CGRectMake(point.x + 10, point.y + 10, 220, 128)
                                                       cornerRadius: 8];
    } else {
        if(vertical)
            innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                             CGRectMake(point.x + 5, point.y + 5, 64, 110)
                                                       cornerRadius: 4];
        else
            innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                             CGRectMake(point.x + 5, point.y + 5, 110, 64)
                                                       cornerRadius: 4];
    }
    [color3 setFill];
    [innerCardPath fillWithBlendMode:kCGBlendModeNormal alpha:alpha];

    
    // Draw star card backs - 5x3 for a horizontal card, 3x5 for a vertical card
    int horizontalStars = 5;
    int verticalStars = 3;
    if(vertical) {
        horizontalStars = 3;
        verticalStars = 5;
    }
    
    if([RSGameView isPad]) {
        float x2 = point.x + 40;
        if(vertical)
            x2 = point.x + 35;
        for(int x=0;x<horizontalStars;x++) {
            float y2 = point.y + 18;
            if(vertical)
                y2 = point.y + 24;
            for(int y=0;y<verticalStars;y++) {
                [self drawStarAt:CGPointMake(x2,y2) alpha:1];
                y2 += 40;
            }
            x2 += 40;
        }
    } else {
        float x2 = point.x + 20;
        if(vertical)
            x2 = point.x + 17;
        for(int x=0;x<horizontalStars;x++) {
            float y2 = point.y + 10;
            if(vertical)
                y2 = point.y + 13;
            for(int y=0;y<verticalStars;y++) {
                [self drawStarAt:CGPointMake(x2,y2) alpha:1];
                y2 += 20;
            }
            x2 += 20;
        }
    }

    // Cleanup
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);

}

- (void) drawCardAt:(CGPoint) point suit:(char) suit card:(NSString *) card {
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    UIColor *fillColor = [UIColor colorWithRed: 0.644 green: 0.078 blue: 0.078 alpha: 1];
    UIColor *gradient2Color = [UIColor colorWithRed: 0.227 green: 0.667 blue: 0.812 alpha: 1];
    UIColor *color2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor *gradient2Color2 = [UIColor colorWithRed: 0.169 green: 0.169 blue: 0.169 alpha: 1];
    
    // Gradient Declarations
    NSArray *gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)gradient2Color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace,
                                                         (__bridge CFArrayRef)gradient2Colors,
                                                         gradient2Locations);
    
    // Shadow Declarations
    UIColor *shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.65];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 4.5;
    
    // Outer Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath *outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 150, 240)
                                                                 cornerRadius: 8];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(point.x - 20, point.y + 20),
                                    CGPointMake(point.x + 200, point.y + 220), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath stroke];
    } else {
        UIBezierPath *outerCardPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(point.x, point.y, 75, 120)
                                                                 cornerRadius: 4];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [outerCardPath addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(point.x - 10, point.y + 10),
                                    CGPointMake(point.x + 100, point.y + 110), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        outerCardPath.lineWidth = 1;
        [outerCardPath stroke];
    }

    // Inner Card Drawing
    if([RSGameView isPad]) {
        UIBezierPath *innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                                       CGRectMake(point.x + 10, point.y + 10, 130, 220)
                                                                 cornerRadius: 8];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [[UIColor whiteColor] setFill];
        [innerCardPath fill];
        CGContextRestoreGState(context);
        
        [[UIColor blackColor] setStroke];
        innerCardPath.lineWidth = 1;
        [innerCardPath stroke];
    } else {
        UIBezierPath *innerCardPath = [UIBezierPath bezierPathWithRoundedRect:
                                       CGRectMake(point.x + 5, point.y + 5, 65, 110)
                                                                 cornerRadius: 4];
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
        UIBezierPath *spadePath = [RSCardSuits createSpadeAtPoint:point isPad:[RSGameView isPad]];
        [color2 setFill];
        [spadePath fill];
    } else if(suit == SUIT_HEART) {
        UIBezierPath *heartPath = [RSCardSuits createHeartAtPoint:point isPad:[RSGameView isPad]];
        [fillColor setFill];
        [heartPath fill];
    } else if(suit == SUIT_DIAMOND) {
        UIBezierPath *diamondPath =  [RSCardSuits createDiamondAtPoint:point isPad:[RSGameView isPad]];
        [fillColor setFill];
        [diamondPath fill];
    } else if(suit == SUIT_CLUB) {
        if([RSGameView isPad]) {
            UIBezierPath *rectanglePath = [UIBezierPath bezierPath];
            [rectanglePath moveToPoint: CGPointMake(point.x + 61.5, point.y + 178.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 85.5, point.y + 178.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 75.9, point.y + 104.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 68.7, point.y + 104.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 61.5, point.y + 178.5)];
            [rectanglePath closePath];
            [color2 setFill];
            [rectanglePath fill];
            
            [[UIColor blackColor] setStroke];
            rectanglePath.lineWidth = 1;
            [rectanglePath stroke];
            
            UIBezierPath *cloverPath1 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 67, point.y + 95, 51, 51)];
            [color2 setFill];
            [cloverPath1 fill];
            
            UIBezierPath *cloverPath2 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 49, point.y + 54, 51, 51)];
            [color2 setFill];
            [cloverPath2 fill];
            
            UIBezierPath *cloverPath3 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 30, point.y + 95, 51, 51)];
            [color2 setFill];
            [cloverPath3 fill];
        } else {
            UIBezierPath *rectanglePath = [UIBezierPath bezierPath];
            [rectanglePath moveToPoint: CGPointMake(point.x + 33.5, point.y + 88.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 39.5, point.y + 88.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 37.1, point.y + 46.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 35.3, point.y + 46.5)];
            [rectanglePath addLineToPoint: CGPointMake(point.x + 33.5, point.y + 88.5)];
            [rectanglePath closePath];
            [color2 setFill];
            [rectanglePath fill];
            
            [[UIColor blackColor] setStroke];
            rectanglePath.lineWidth = 1;
            [rectanglePath stroke];
            
            UIBezierPath *cloverPath1 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 35, point.y + 51, 27, 27)];
            [color2 setFill];
            [cloverPath1 fill];
            
            UIBezierPath *cloverPath2 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 23, point.y + 30, 27, 27)];
            [color2 setFill];
            [cloverPath2 fill];

            UIBezierPath *cloverPath3 = [UIBezierPath bezierPathWithOvalInRect:
                                         CGRectMake(point.x + 12, point.y + 51, 27, 27)];
            [color2 setFill];
            [cloverPath3 fill];
        }
    }
    CGContextRestoreGState(context);

    CGContextSaveGState(context);

    // Font styling for card numeration:
    
    // Init so we can determine if it's a face card or a number, for some reason the numbers don't align right:
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    float y_offset = 0;

    NSNumber *cardVal = [f numberFromString:card];
    // Numbers are slightly offset for some reason in Georgia-Bold...
    if(cardVal) {
        if(([cardVal intValue] == 6) || ([cardVal intValue] == 8)) {
            // But they're NOT the same offset for 6 or 8.
            if([RSGameView isPad]) {
                y_offset = 1;
            } else {
                y_offset = 0.5;
            }
        } else if(([cardVal intValue] == 1) || ([cardVal intValue] == 2)) {
            // And we have to set a diff font because 1 + 2 are messed up for some reason...
            if([RSGameView isPad]) {
                y_offset = 9;
            } else {
                y_offset = 4.5;
            }
        } else {
            if([RSGameView isPad]) {
                y_offset = 6;
            } else {
                y_offset = 3;
            }
        }
    }
    
    NSMutableDictionary *strAttribs = [[NSMutableDictionary alloc] init];
    if(suit == SUIT_CLUB || suit == SUIT_SPADE) {
        [strAttribs setObject:color2 forKey:NSForegroundColorAttributeName];
    } else {
        [strAttribs setObject:fillColor forKey:NSForegroundColorAttributeName];
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    if([RSGameView isPad]) {
        if(cardVal && (([cardVal intValue] == 1) || ([cardVal intValue] == 2))) {
            [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: 46] forKey:NSFontAttributeName];
        } else {
            [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: 36] forKey:NSFontAttributeName];
        }
    } else {
        if(cardVal && (([cardVal intValue] == 1) || ([cardVal intValue] == 2))) {
            [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: 21] forKey:NSFontAttributeName];
        } else {
            [strAttribs setObject:[UIFont fontWithName: @"Georgia-Bold" size: 17] forKey:NSFontAttributeName];
        }
    }
    [strAttribs setObject:style forKey:NSParagraphStyleAttributeName];
    
    // Upper Left Card # Drawing
    if([RSGameView isPad]) {
        CGRect upperLeftRect = CGRectMake(point.x + 12.5 , point.y + 10.5 - y_offset, 43, 43);
        [card drawInRect:upperLeftRect withAttributes:strAttribs];
    } else {
        CGRect upperLeftRect = CGRectMake(point.x + 6.5, point.y + 6.5 - y_offset, 23, 21);
        [card drawInRect:upperLeftRect withAttributes:strAttribs];
    }
    
    // Lower Right Card # Drawing
    if([RSGameView isPad]) {
        CGRect lowerRightRect = CGRectMake(point.x + 92.5, point.y + 184.5 - y_offset, 43, 43);
        [card drawInRect:lowerRightRect withAttributes:strAttribs];
    } else {
        CGRect lowerRightRect = CGRectMake(point.x + 47.5, point.y + 91.5 - y_offset, 23, 22);
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
    UIColor *fillColor = [UIColor colorWithRed:0.243 green: 0.525 blue: 0.125 alpha: 1];
    UIColor *strokeColor = [UIColor colorWithRed: 0.295 green: 0.365 blue: 0.195 alpha: 1];

    
    // Gradient Declarations
    NSArray *gradientColors = [NSArray arrayWithObjects:
                               (id)strokeColor.CGColor,
                               (id)fillColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors,
                                                        gradientLocations);
    
    // Rectangle Drawing
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, self.bounds.size.width,
                                                                               self.bounds.size.height)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(self.bounds.size.width / 2, 0.5),
                                CGPointMake(self.bounds.size.width / 2, self.bounds.size.height), 0);
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
    NSString *textContent = @"Waiting for more players to join the game.";

    // Shadow Declarations
    UIColor *shadow = [UIColor blackColor];
    CGSize shadowOffset = CGSizeMake(3.1, 3.1);
    CGFloat shadowBlurRadius = 5;
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);

    if([RSGameView isPad]) {
        // bounding box
        UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 400, 200)
                                                                        cornerRadius: 8];
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
        UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(x, y, 200, 100)
                                                                        cornerRadius: 4];
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
        [strAttribs setObject:[UIFont fontWithName: @"Georgia-Italic" size: [UIFont labelFontSize]]
                       forKey:NSFontAttributeName];
    }

    [strAttribs setObject:style forKey:NSParagraphStyleAttributeName];
    
    // Text Drawing
    [[UIColor blackColor] setFill];
    [textContent drawInRect:textRect withAttributes:strAttribs];
}

- (void) drawPlayerHighlight:(CGRect) size {
    // Color Declarations
    UIColor *color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    // Rounded Rectangle Drawing
    UIBezierPath *roundedRectanglePath;
    
    if([RSGameView isPad]) {
        roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:
                                CGRectMake(size.origin.x - 10, size.origin.y - 10,
                                           size.size.width + 20, size.size.height + 20)
                                                          cornerRadius: 8];
    } else {
        roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:
                                CGRectMake(size.origin.x - 5, size.origin.y - 5,
                                           size.size.width + 10, size.size.height + 10)
                                                          cornerRadius: 4];
    }
    [color setFill];
    [roundedRectanglePath fillWithBlendMode:kCGBlendModeNormal alpha:0.5];
    [[UIColor blackColor] setStroke];
    if([RSGameView isPad]) {
        roundedRectanglePath.lineWidth = 2;
    } else {
        roundedRectanglePath.lineWidth = 1;
    }
    CGFloat roundedRectanglePattern[] = {1, 1, 1, 1};
    [roundedRectanglePath setLineDash: roundedRectanglePattern count: 4 phase: 0];
    [roundedRectanglePath strokeWithBlendMode:kCGBlendModeNormal alpha:0.3];
}

- (BOOL) shouldBeVertical:(int) player {
    if(horizontal) {
        if(((player == (myPosition + 1)) || (player == (myPosition - 1))) && (totalPlayers == 2)) {
            return NO;
        } else if((player == (myPosition + 2)) || (player == myPosition) || (player == myPosition - 2)) {
            return NO;
        } else {
            return YES;
        }
    } else {
        if(((player == (myPosition + 1)) || (player == (myPosition - 1))) && (totalPlayers == 2)) {
            return YES;
        } else if((player == (myPosition + 2)) || (player == myPosition) || (player == myPosition - 2)) {
            return YES;
        } else {
            return NO;
        }
    }

    return NO;
}

- (void) drawVisibleStackedCards {
    for(RSVisibleCard *card in visibleStackedCards) {
        if([card belongsToPlayer] == myPosition) {
            // If this is active playing position, we're going to draw something underneath to denote it
            [self drawPlayerHighlight:[card cardSize]];
        }
        float alpha = 1.0;
        if([card belongsToPlayer] > currentPlayers)
            alpha = 0.15;
        if(![card active])
            alpha = 0.15;
        // Cards along left or right side should be horizontal (facing center pile) instead of vertical
        [self drawCardBackAt:[card cardPosition]
                       alpha:alpha
                    vertical:[self shouldBeVertical:[card belongsToPlayer]]];
    }
}

- (void) drawVisiblePlayedCards {
    for(RSVisibleCard *card in visiblePlayedCards) {
        [self drawCardAt:[card cardPosition] suit:[card suit] card:[card face]];
    }
}

- (void)drawRect:(CGRect)rect {
    // NSLog(@"Game View: redrawing game view");
    [self drawBackground];
    [self drawVisibleStackedCards];
    if(stillWaiting) {
        // If we're waiting, let's make sure the player knows
        if([RSGameView isPad]) {
            [self drawWaitingDisplayatX:self.bounds.size.width / 2 - 200 y:self.bounds.size.height / 2 - 100];
        } else {
            [self drawWaitingDisplayatX:self.bounds.size.width / 2 - 100 y:self.bounds.size.height / 2 - 50];
        }
    } else {
        // If we're not waiting, draw the cards that have been played
        [self drawVisiblePlayedCards];
    }
}

- (void) setWaiting: (BOOL) waiting {
    stillWaiting = waiting;
    [self setNeedsDisplay];
}

- (void) setPlayers: (int) current
              total:(int) total
           position:(int) position
        playerNames: (NSMutableArray *) newPlayerNames {

    myPosition = position;
    totalPlayers = total;
    currentPlayers = current;
    playerNames = newPlayerNames;
    
    [self repositionStackedCards];
    [self setNeedsDisplay];
}

- (void) setOrientationHorizontal: (BOOL) isHorizontal {
    if(horizontal != isHorizontal) {
        NSLog(@"Game View: Changing current orientation");
        horizontal = isHorizontal;
        [self repositionStackedCards];
        [self repositionPlayedCards];
    }
}

- (CGRect) getPlayer4Position {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width / 2 - 75, -120, 150, 240);
        } else {
            return CGRectMake(self.bounds.size.width / 2 - 37.5, -60, 75, 120);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width - 120, self.bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(self.bounds.size.width - 60, self.bounds.size.height / 2 - 37.5, 120, 75);
        }
    }
}

- (CGRect) getPlayer3Position {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width / 2 - 75, self.bounds.size.height - 120, 150, 240);
        } else {
            return CGRectMake(self.bounds.size.width / 2 - 37.5, self.bounds.size.height - 60, 75, 120);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(-120, self.bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(-60, self.bounds.size.height / 2 - 37.5, 120, 75);
        }
    }
}

- (CGRect) getPlayer2Position {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(-120, self.bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(-60, self.bounds.size.height / 2 - 37.5, 120, 75);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width / 2 - 75, -120, 150, 240);
        } else {
            return CGRectMake(self.bounds.size.width / 2 - 37.5, -60, 75, 120);
        }
    }
}

- (CGRect) getPlayer1Position {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width - 251, self.bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(self.bounds.size.width - 125.5, self.bounds.size.height / 2 - 37.5, 120, 75);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(self.bounds.size.width / 2 - 75, self.bounds.size.height - 251, 150, 240);
        } else {
            return CGRectMake(self.bounds.size.width / 2 - 37.5, self.bounds.size.height - 125.5, 75, 120);
        }
    }
}


- (void) repositionStackedCards {
    // Clear out all old stacked cards:
    [visibleStackedCards removeAllObjects];
    
    for(int i=1;i<=totalPlayers;i++) {
        RSVisibleCard *newCard = [[RSVisibleCard alloc] initWithCardSize:CGRectMake(0, 0, 0, 0)];
        if(i == myPosition) {
            // Player Position
            [newCard setCardSize:[self getPlayer1Position]];
        } else if(totalPlayers == 2) {
            // If there are only 2 players, place opposed to player
            [newCard setCardSize:[self getPlayer2Position]];
        } else {
            if((i == myPosition + 1) || (i == myPosition - 3)) {
                // Clockwise Player
                [newCard setCardSize:[self getPlayer4Position]];
            } else if((i == myPosition + 2) || (i == myPosition - 2)) {
                [newCard setCardSize:[self getPlayer2Position]];
            } else {
                // Counterclockwise to Player
                [newCard setCardSize:[self getPlayer3Position]];
            }
        }
        [newCard setPlayer:i];
        
        // If there is a player for this position, assign his name to the stack
        if(i <= [playerNames count])
            [newCard setFace:[playerNames objectAtIndex:(i-1)]];
        else
            [newCard setFace:@"Waiting..."];
        [visibleStackedCards addObject:newCard];
    }
    [self setNeedsDisplay];

}

- (void) repositionPlayedCards {
    // Loop through and make sure all the played cards have the proper positions
    float current_x = (self.bounds.size.width / 2);
    if([RSGameView isPad]) {
        if([visiblePlayedCards count] % 2)
            current_x = current_x - ((([visiblePlayedCards count] / 2) + 1) * 75);
        else
            current_x = current_x - ((([visiblePlayedCards count] / 2) + 0.5) * 75);
    } else {
        if([visiblePlayedCards count] % 2)
            current_x = current_x - ((([visiblePlayedCards count] / 2) + 1) * 37.5);
        else
            current_x = current_x - ((([visiblePlayedCards count] / 2) + 0.5) * 37.5);
    }
    
    for(RSVisibleCard *card in visiblePlayedCards) {
        if([RSGameView isPad]) {
            [card setCardSize:CGRectMake(current_x, self.bounds.size.height / 2 - 120, 150, 240)];
            current_x = current_x + 75;
        } else {
            // For some reason 3.5 vs 4 inch screens don't actually return the height properly??
            if(([[UIScreen mainScreen] bounds].size.height == 480) && !horizontal) {
                [card setCardSize:CGRectMake(current_x, (self.bounds.size.height / 2) - 100, 75, 120)];
            } else {
                [card setCardSize:CGRectMake(current_x, (self.bounds.size.height / 2) - 60, 75, 120)];
            }
            current_x = current_x + 37.5;
        }
    }
    [self setNeedsDisplay];

}

- (void) addCardToPlayed:(NSString *) card suit:(char) suit {
    // Make sure we remove any extra cards before adding one
    while([visiblePlayedCards count] >= maxPlayedVisible) {
        [visiblePlayedCards removeObjectAtIndex:0];
    }
    [visiblePlayedCards addObject:[[RSVisibleCard alloc] initShowingWithFace:card
                                                                        suit:suit
                                                                    cardSize:CGRectMake(0, 0, 0, 0)]];
    [self repositionPlayedCards];
}

- (void) clearPlayedCards {
    [visiblePlayedCards removeAllObjects];
    [self setNeedsDisplay];
}

#pragma mark User Touch Interaction

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!stillWaiting) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        // NSLog(@"Game View: TOUCH at (%f,%f)", point.x, point.y);
        for(RSVisibleCard *card in visiblePlayedCards) {
            if((point.x >= [card cardPosition].x) &&
               (point.x <= ([card cardPosition].x + [card cardSize].size.width))) {
                if((point.y >= [card cardPosition].y) &&
                   (point.y <= ([card cardPosition].y + [card cardSize].size.height))) {
                    if([card active] && [card playable]) {
                        touchPending = YES;
                        touchedCard = card;
                        NSLog(@"Game View: An active playedcard has been pressed");
                        return;
                    }
                }
            }
        }
        for(RSVisibleCard *card in visibleStackedCards) {
            if((point.x >= [card cardPosition].x) &&
               (point.x <= ([card cardPosition].x + [card cardSize].size.width))) {
                if((point.y >= [card cardPosition].y) &&
                   (point.y <= ([card cardPosition].y + [card cardSize].size.height))) {
                    if([card active] && [card playable]) {
                        touchPending = YES;
                        touchedCard = card;
                        NSLog(@"Game View: An active stack card has been pressed");
                        return;
                    }
                }
            }
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Game View: System says NO TOUCHING");
    touchPending = NO;
    touchedCard = nil;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!stillWaiting && touchPending) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        // NSLog(@"Game View: TOUCH RELEASE at (%f,%f)", point.x, point.y);
        if((point.x >= [touchedCard cardPosition].x) &&
           (point.x <= ([touchedCard cardPosition].x + [touchedCard cardSize].size.width))) {
            if((point.y >= [touchedCard cardPosition].y) &&
               (point.y <= ([touchedCard cardPosition].y + [touchedCard cardSize].size.height))) {
                if([touchedCard active] && [touchedCard playable]) {
                    NSLog(@"Game View: the active card was released");
                }
            }
        }

        touchPending = NO;
        touchedCard = nil;
    }
}

@end
