//
//  HangmanModel.m
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//


#import "HangmanModel.h"
#import "HangmanWords.h"

static unsigned int games = 0;
static unsigned int wins = 0;
static unsigned int losses = 0;

@implementation HangmanModel

@synthesize chosenWord;
@synthesize blanks;
@synthesize allGuess;
@synthesize missed;

- (id) initWithLevel:(NSString *) level
{
    self = [super init];
    if (self){
        HangmanWords *words = [[HangmanWords alloc] initWithLevel: level];
        self.chosenWord = [words getWord];
        (NSLog(@"chosenWord: %@",chosenWord));
        self.blanks = [[NSMutableArray alloc] init];
        for (unsigned int i = 0; i < [chosenWord length]; i++){
            NSNumber *false_obj = [NSNumber numberWithBool:false];
            [blanks addObject:false_obj];
        }
        self.allGuess  = [[NSMutableArray alloc] init];
        self.missed  = [[NSMutableArray alloc] init];
        _guessCount = 0;
    }
    return self;
}

+ (void) saveGame: (BOOL) win
{
    games++;
    if (win){
        wins++;
    } else {
        losses++;
    }
}
+ (unsigned int) totalGames
{
    return games;
}
+ (unsigned int) totalLosses
{
    return losses;
}
+ (unsigned int) totalWins
{
    return wins;
}


- (void) incrementCount
{
    _guessCount++;
}

- (unsigned int) getGuessCount
{
    return _guessCount;
}

- (BOOL) checkAlreadyGuessed: (NSString *) guess
{
    return [allGuess containsObject:guess];
}

- (BOOL) updateBlanks:(NSString *) guess
{
    BOOL rtn = false;
    NSNumber *true_obj = [NSNumber numberWithBool:true];
    for (NSUInteger index = 0; index < [chosenWord length]; index++){
        char single_char = [chosenWord characterAtIndex:index];
        char guess_char  = [guess characterAtIndex:0];
        char space_char  = [@" " characterAtIndex:0];
        if (single_char == space_char){
            [blanks replaceObjectAtIndex:index withObject:true_obj];
        } else if (single_char == guess_char){
            rtn = true;
            [blanks replaceObjectAtIndex:index withObject:true_obj];
        }
    }
    [self updateGuessed:guess];
    return rtn;
}

- (void) updateGuessed:(NSString *) guess
{
    [allGuess addObject:guess];
}



@end