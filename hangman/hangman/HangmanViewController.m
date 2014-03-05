//
//  HangmanViewController.m
//  Hangman
//
//  Created by Zack Field on 3/5/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import "HangmanViewController.h"
#import "HangmanView.h"
#import "HangmanModel.h"
@class HangmanView;

@implementation HangmanController;

@synthesize _HangmanView;
@synthesize _mainModel;
@synthesize _timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mainModel updateBlanks:@" "];
    [self fillBlanks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) awakeFromNib
{
    _mainModel = [[HangmanModel alloc] initWithLevel:@"easy"];
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/30)
                                              target:self
                                            selector:@selector(timerFireMethod:)
                                            userInfo:nil
                                             repeats:YES];
    [_mainModel updateBlanks:@" "];
    [self fillBlanks];
}

- (void) timerFireMethod:(NSTimer*) theTimer
{
    [_HangmanView setNeedsDisplay];
}


- (IBAction)resetButtonPressed:(id)sender
{
    NSLog(@"%@'s title is now %@",sender,[sender currentTitle]);
    [self resetBoard:@"easy"];
    
}

- (void) resetBoard: (NSString *) level
{
    [_HangmanView blankTextViews];
    [[_HangmanView guessButton] setUserInteractionEnabled:YES];
    [[_HangmanView guess_text] setUserInteractionEnabled:YES];
    _mainModel = [[HangmanModel alloc] initWithLevel:level];
    [_mainModel updateBlanks:@" "];
    [self fillBlanks];
}

- (IBAction)expertGame:(id)sender
{
    [self resetBoard:@"expert"];
}

- (IBAction)guessButtonPressed:(id)sender
{
    NSLog(@"%@'s title is now %@",sender,[sender currentTitle]);
    // Allow guess to act as reset if game is lost or won
    NSNumber *false_obj = [NSNumber numberWithBool:false];
    if ([_mainModel getGuessCount] > 6 || ![[_mainModel blanks] containsObject:false_obj]){
        [self resetBoard: @"easy"];
    }
    
    NSString *guess = [[_HangmanView guess_text] text];
    [self boardUpdate: guess];
}

- (void) boardUpdate: (NSString *) guess
{
    [[_HangmanView guess_text ] setText:@""];
    if ([guess length] == 1){
        if (![_mainModel checkAlreadyGuessed:guess]){
            BOOL updated =  [_mainModel updateBlanks:guess];
            if (!updated){
                //another strike!!
                [_mainModel incrementCount];
                [[_mainModel missed] addObject:guess];
                NSLog(@"GUESS COUNT: %i", [_mainModel getGuessCount]);
                if ([_mainModel getGuessCount] > 6){ //Check lose condition
                    [self loseCondition];
                    return;
                }
            }
            [self fillBlanks];
            [self fillMissed];
            if (![[_mainModel blanks] containsObject:[NSNumber numberWithBool:false]]) { // check win condition
                NSLog(@"WINNER!!!!");
                [self winCondition];
                
            }
            
        }
    }
}

- (void) updateAverage
{
    unsigned int games = [HangmanModel totalGames];
    unsigned int wins  = [HangmanModel totalWins];
    [[_HangmanView avgField] setText:[[NSString alloc] initWithFormat:@"%i/%i",wins,games]];
    
}
- (void) loseCondition
{
    [HangmanModel saveGame: false];
    [[_HangmanView blank_text] setText:[_mainModel chosenWord]];
    [[_HangmanView missed_text] setText:@"You Lose"];
    [self updateAverage];
    //[_HangmanView textFieldShouldReturn:[_HangmanView guess_text]];
}

- (void) winCondition
{
    [HangmanModel saveGame:true];
    [[_HangmanView blank_text] setText:[_mainModel chosenWord]];
    [[_HangmanView missed_text] setText:@"You Win!"];
    [self updateAverage];
    //[_HangmanView textFieldShouldReturn:[_HangmanView guess_text]];
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (unsigned int)getStage
{
    return [_mainModel getGuessCount];
}

- (void) fillBlanks
{
    NSString *chosenWord = [_mainModel chosenWord];
    NSMutableArray *blanks = [_mainModel blanks];
    NSString *out_string = @"";
    char space_char = [@" " characterAtIndex:0];
    NSInteger index = 0;
    for (NSNumber *blank in blanks){
        if ([blank boolValue]){
            char single_char = [chosenWord characterAtIndex:index];
            if (single_char == space_char){
                out_string = [[NSString alloc] initWithFormat:@"  %@  ",out_string];
            }
            out_string = [[NSString alloc] initWithFormat:@"%@%c",out_string,single_char];
        } else {
            out_string = [[NSString alloc] initWithFormat:@"%@_",out_string];
        }
        index++;
    }
    [[_HangmanView blank_text] setText:out_string];
}

- (void) fillMissed
{
    NSMutableArray *all = [_mainModel missed];
    NSString *out_string = @"";
    for (NSString *guess in all){
        if ([out_string isEqualToString:@""]){
            out_string = guess;
        } else {
            out_string = [[NSString alloc ]initWithFormat:@"%@,%@",out_string,guess];
        }
    }
    [[_HangmanView missed_text] setText:out_string];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self guessButtonPressed:[_HangmanView guessButton]];
    return YES;
}



@end
