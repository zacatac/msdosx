//
//  HangmanView.m
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//


#import "HangmanView.h"
#import "HangmanViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation HangmanView

@synthesize mainController;
@synthesize hangmanImageView;
@synthesize blank_text;
@synthesize guess_text;
@synthesize missed_text;
@synthesize guessButton;
@synthesize resetButton;
@synthesize expertButton;

- (void) drawRect:(CGRect) dirtyRect
{
    unsigned int stage = [mainController getStage];
    NSString *imageString = [NSString stringWithFormat:@"hang_%d.gif",stage];
    
    UIImage *image = [UIImage imageNamed:imageString];
    [hangmanImageView setImage:image];
    [guess_text becomeFirstResponder];
    [[self.blank_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.blank_text layer] setBorderWidth:2.3];
    [[self.blank_text layer] setCornerRadius:15];
    [[self.guess_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.guess_text layer] setBorderWidth:2.3];
    [[self.guess_text layer] setCornerRadius:15];
    [[self.missed_text layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.missed_text layer] setBorderWidth:2.3];
    [[self.missed_text layer] setCornerRadius:15];
    [[guessButton layer] setBorderColor:[UIColor grayColor].CGColor];
    [[guessButton layer] setBorderWidth:2.3];
    [[guessButton layer] setCornerRadius:15];
    [[resetButton layer] setBorderColor:[UIColor grayColor].CGColor];
    [[resetButton layer] setBorderWidth:2.3];
    [[resetButton layer] setCornerRadius:15];
    [[expertButton layer] setBorderColor:[UIColor grayColor].CGColor];
    [[expertButton layer] setBorderWidth:2.3];
    [[expertButton layer] setCornerRadius:15];
    
}

- (void) blankTextViews
{
    [guess_text setText:@""];
    [blank_text setText:@""];
    [missed_text setText:@""];
}


- (BOOL)textFieldShouldReturn:(UITextView *)textView
{
    [textView resignFirstResponder];
    return NO;
}
@end