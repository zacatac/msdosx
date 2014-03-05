//
//  HangmanWords.m
//  
//
//  Created by Kevin Jorgensen on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HangmanWords.h"


@implementation HangmanWords

- (id) initWithLevel: (NSString *) level {
	if ((self = [super init])) {
        if ([level isEqualToString:@"expert"]){
            words = [[NSArray alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"expert_words" ofType: @"plist"]];
        } else {
            words = [[NSArray alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"words" ofType: @"plist"]];
        }
		
		srand(time(NULL));
	}
	return self;
}


- (NSString *) getWord {
	int index = rand() % [words count];
	return [words objectAtIndex: index];
}


@end
