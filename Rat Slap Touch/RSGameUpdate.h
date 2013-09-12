//
//  RSGameUpdate.h
//  Rat Slap Touch
//
//  Created by mandrake on 9/7/13.
//  Copyright (c) 2013 mandrake. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GAME_WAITING 0
#define GAME_PLAYING 1
#define GAME_NEWPLAYER 2
#define GAME_PLAYERLEAVE 3
#define GAME_STARTING 4
#define GAME_OVER 5

@interface RSGameUpdate : NSObject {
    int players;
    int gameSize;
    int gameID;
    char gameStatus;
    int position;
}

- (id) initWithPlayers: (int) newPlayers newGameSize:(int) newGameSize gameID:(int) newGameID status:(NSString *) newStatus position:(int) newPosition;

- (char) gameStatus;
- (char) status;
- (int) gameID;
- (int) gameSize;
- (int) players;
- (int) position;

@end
