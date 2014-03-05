//
//  ViewController.m
//  hangman
//
//  Created by Zack Field on 3/4/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import "HangmanController.h"
#import "HangmanView.h"
@class HangmanView;
@implementation HangmanController;

@synthesize _HangmanView;
@synthesize _mainModel;
@synthesize _timer;

- (void)viewDidLoadb
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) awakeFromNib
{
    _mainModel = [[HangmanModel alloc] init];
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/30)
                                              target:self
                                            selector:@selector(timerFireMethod:)
                                            userInfo:nil
                                             repeats:YES];
}

- (void) timerFireMethod:(NSTimer*) theTimer
{
    [_HangmanView setNeedsDisplay];
}


- (IBAction)resetButtonPressed:(id)sender
{
    NSLog(@"%@'s title is now %@",sender,[sender currentTitle]);
    
}

- (IBAction)guessButtonPressed:(id)sender
{
    NSLog(@"%@'s title is now %@",sender,[sender currentTitle]);
    [_mainModel incrementCount];
}

- (unsigned int)getStage
{
    return [_mainModel getGuessCount];
}

@end
