//
//  HangmanView.h
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HangmanViewController;

@interface HangmanView : UIView
@property (weak, nonatomic) IBOutlet UITextView  *blank_text;
@property (weak, nonatomic) IBOutlet UITextView  *guess_text;
@property (weak, nonatomic) IBOutlet UITextView  * missed_text;
@property (weak, nonatomic) IBOutlet UIImageView *hangmanImageView;
@property (weak, nonatomic) IBOutlet UIButton *guessButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *expertButton;
@property (weak, nonatomic) IBOutlet UITextField *avgField;

@property IBOutlet HangmanViewController *mainController;

- (void) drawRect:(CGRect)rect;
- (void) blankTextViews;
- (BOOL) textFieldShouldReturn:(UITextView *)textView;
@end
