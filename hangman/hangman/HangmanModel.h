//
//  HangmanModel.h
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanModel : NSObject
{
    @private unsigned int _guessCount;
}
@property(nonatomic, retain) NSString *chosenWord;
@property(nonatomic, retain) NSArray *guessSoFar;


- (id) init;
- (void) incrementCount;
- (unsigned int) getGuessCount;
@end
