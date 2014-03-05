//
//  ViewController.h
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanModel.h"
#import "HangmanView.h"


@interface HangmanController : UIViewController

@property (nonatomic, retain) IBOutlet  HangmanView *_HangmanView;
@property(nonatomic, retain) HangmanModel *_mainModel;
@property(nonatomic, retain) NSTimer *_timer;

- (void)didReceiveMemoryWarning;
- (void)viewDidLoadb;
- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)guessButtonPressed:(id)sender;
- (unsigned int)getStage;
- (void) timerFireMethod:(NSTimer*) theTimer;
- (void) awakeFromNib;

@end
