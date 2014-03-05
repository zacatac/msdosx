//
//  HangmanModel.h
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanModel : NSObject
{
    @private unsigned int _guessCount;
    
}
@property(nonatomic, retain) NSString *chosenWord;
@property(nonatomic, retain) NSMutableArray *blanks;
@property(nonatomic, retain) NSMutableArray *allGuess;
@property(nonatomic, retain) NSMutableArray *missed;

+ (void) saveGame: (BOOL) win;
+ (unsigned int) totalGames;
+ (unsigned int) totalLosses;
+ (unsigned int) totalWins;
- (id) initWithLevel:(NSString *) level;
- (void) incrementCount;
- (unsigned int) getGuessCount;
- (BOOL) checkAlreadyGuessed: (NSString *)guess;
- (BOOL) updateBlanks:(NSString *) guess;
- (void) updateGuessed: (NSString *) guess;

@end
