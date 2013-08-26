//
//  RSStatusUpdate.m
//  Rat Slap Touch
//
//  Created by Geoff Harrison on 8/26/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSStatusUpdate.h"

@implementation RSStatusUpdate

- (id) initWithClients:(int) numClients games:(int) numGames twoWaiting:(int) numTwoWaiting fourWaiting:(int) numFourWaiting {
    self = [super init];
    if(self) {
        twoWaiting = numTwoWaiting;
        fourWaiting = numFourWaiting;
        clients = numClients;
        games = numGames;
    }
    return self;
}

- (int) clients {
    return clients;
}

- (int) games {
    return games;
}

- (int) twoWaiting {
    return twoWaiting;
}

- (int) fourWaiting {
    return fourWaiting;
}

@end
