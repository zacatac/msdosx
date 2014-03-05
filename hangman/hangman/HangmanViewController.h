//
//  HangmanViewController.h
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanModel.h"
#import "HangmanView.h"


@interface HangmanController : UIViewController

@property (weak, nonatomic) IBOutlet  HangmanView *_HangmanView;
@property(nonatomic, retain) HangmanModel *_mainModel;
@property(nonatomic, retain) NSTimer *_timer;

- (void) didReceiveMemoryWarning;
- (void) viewDidLoad;
- (IBAction) resetButtonPressed:(id)sender;
- (IBAction) guessButtonPressed:(id)sender;
- (unsigned int) getStage;
- (void) timerFireMethod:(NSTimer*) theTimer;
- (void) awakeFromNib;
- (void) fillBlanks;
- (void) fillMissed;
- (void) winCondition;
- (void) loseCondition;
- (void) boardUpdate: (NSString *) guess;
- (void) resetBoard;
- (void) updateAverage;
- (NSUInteger)supportedInterfaceOrientations;
@end
