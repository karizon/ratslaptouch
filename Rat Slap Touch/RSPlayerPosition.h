//
//  RSPlayerPosition.h
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 10/6/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSPlayerPosition : NSObject;

+ (CGRect) getPlayer4Position:(BOOL) horizontal size:(CGRect) bounds;
+ (CGRect) getPlayer3Position:(BOOL) horizontal size:(CGRect) bounds;
+ (CGRect) getPlayer2Position:(BOOL) horizontal size:(CGRect) bounds;
+ (CGRect) getPlayer1Position:(BOOL) horizontal size:(CGRect) bounds;

    
@end
