//
//  HangmanView.h
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HangmanController;

@interface HangmanView : UIView
@property IBOutlet HangmanController *mainController;
@property (weak, nonatomic) IBOutlet UIImageView *hangmanImageView;


@end
