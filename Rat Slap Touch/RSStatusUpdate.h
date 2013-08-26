//
//  RSStatusUpdate.h
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 8/26/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSStatusUpdate : NSObject {
    int games;
    int clients;
    int twoWaiting;
    int fourWaiting;
}

- (id) initWithClients:(int) numClients games:(int) numGames twoWaiting:(int) numTwoWaiting fourWaiting:(int) numFourWaiting;

- (int) clients;
- (int) games;
- (int) twoWaiting;
- (int) fourWaiting;
@end
