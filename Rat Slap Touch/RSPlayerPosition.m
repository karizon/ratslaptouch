//
//  RSPlayerPosition.m
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 10/6/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSPlayerPosition.h"
#import "RSGameView.h"

@implementation RSPlayerPosition

+ (CGRect) getPlayer4Position:(BOOL) horizontal size:(CGRect) bounds {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width / 2 - 75, -120, 150, 240);
        } else {
            return CGRectMake(bounds.size.width / 2 - 37.5, -60, 75, 120);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width - 120, bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(bounds.size.width - 60, bounds.size.height / 2 - 37.5, 120, 75);
        }
    }
}
    
+ (CGRect) getPlayer3Position:(BOOL) horizontal size:(CGRect) bounds {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width / 2 - 75, bounds.size.height - 120, 150, 240);
        } else {
            return CGRectMake(bounds.size.width / 2 - 37.5, bounds.size.height - 60, 75, 120);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(-120, bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(-60, bounds.size.height / 2 - 37.5, 120, 75);
        }
    }
}
    
+ (CGRect) getPlayer2Position:(BOOL) horizontal size:(CGRect) bounds {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(-120, bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(-60, bounds.size.height / 2 - 37.5, 120, 75);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width / 2 - 75, -120, 150, 240);
        } else {
            return CGRectMake(bounds.size.width / 2 - 37.5, -60, 75, 120);
        }
    }
}
    
+ (CGRect) getPlayer1Position:(BOOL) horizontal size:(CGRect) bounds {
    if(horizontal) {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width - 251, bounds.size.height / 2 - 75, 240, 150);
        } else {
            return CGRectMake(bounds.size.width - 125.5, bounds.size.height / 2 - 37.5, 120, 75);
        }
    } else {
        if([RSGameView isPad]) {
            return CGRectMake(bounds.size.width / 2 - 75, bounds.size.height - 251, 150, 240);
        } else {
            return CGRectMake(bounds.size.width / 2 - 37.5, bounds.size.height - 125.5, 75, 120);
        }
    }
}

@end
