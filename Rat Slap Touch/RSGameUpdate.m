//
//  RSGameUpdate.m
//  Rat Slap Touch
//
//  Created by mandrake on 9/7/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import "RSGameUpdate.h"

@implementation RSGameUpdate

- (id) initWithPlayers: (int) newPlayers newGameSize:(int) newGameSize gameID:(int) newGameID status:(NSString *) newStatus position:(int) newPosition {
    self = [super init];
    if(self) {
        gameSize = newGameSize;
        players = newPlayers;
        gameID = newGameID;
        position = newPosition;
        if([newStatus isEqualToString:@"NEWPLAYER"]) {
            gameStatus = GAME_NEWPLAYER;
        } else if([newStatus isEqualToString:@"NICKNAMECHANGE"]) {
            gameStatus = GAME_NEWPLAYER;
        } else if([newStatus isEqualToString:@"UPDATE"]) {
            gameStatus = GAME_PLAYING;
        } else if([newStatus isEqualToString:@"GAMESTART"]) {
            gameStatus = GAME_STARTING;
        } else if([newStatus isEqualToString:@"PLAYERPART"]) {
            gameStatus = GAME_PLAYERLEAVE;
        }
    }
    return self;
}

- (int) players {
    return players;
}

- (int) gameSize {
    return gameSize;
}

- (int) gameID {
    return gameID;
}

- (char) status {
    return gameStatus;
}

- (char) gameStatus {
    return gameStatus;
}

- (int) position {
    return position;
}

@end
