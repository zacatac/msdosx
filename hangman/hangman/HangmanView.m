//
//  HangmanView.m
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import "HangmanView.h"
#import "HangmanController.h"

@implementation HangmanView

@synthesize mainController;
@synthesize hangmanImageView;

- (void) drawRect:(CGRect) dirtyRect
{
    unsigned int stage = [mainController getStage];
    NSString *imageString = [NSString stringWithFormat:@"hang_%d.gif",stage];
    UIImage *image = [UIImage imageNamed:imageString];
    [hangmanImageView setImage:image];
}

@end
