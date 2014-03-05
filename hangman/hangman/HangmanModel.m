//
//  HangmanModel.m
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import "HangmanModel.h"

@implementation HangmanModel

@synthesize chosenWord;
@synthesize guessSoFar;

- (id) init
{
    self = [super init];
    if (self){
        self.chosenWord = @"goats";
        self.guessSoFar = [[NSArray alloc] init];
        _guessCount = 0;
    }
    return self;
}

- (void) incrementCount
{
    NSLog(@"CALLED");
    printf("COUNT: %d",_guessCount);
    _guessCount++;
    printf("COUNT: %d",_guessCount);
}

- (unsigned int) getGuessCount
{
    return _guessCount;
}

@end
