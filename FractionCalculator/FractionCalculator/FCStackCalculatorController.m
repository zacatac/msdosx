//
//  FCStackCalculatorController.m
//  FractionCalculator
//
//  Created by Zack Field on 2/4/14.
//
//

#import "FCStackCalculatorController.h"


@implementation FCStackCalculatorController

- (id) init
{
    self = [super init];
    
    if (self)
    {
        _stack = [[FCStack alloc] init];
    }
    
    return self;
}

- (void) respondToInput:(NSString *)input
{
    [FCConsole writeLine: input];
    if ([input hasPrefix:@"push"])
    {
        NSString *fractionString = [input substringFromIndex:5];
        NSUInteger slash = [fractionString rangeOfString:@"/"].location;
        int numerator =  [[fractionString substringToIndex:slash] intValue];
        int denominator = [[fractionString substringFromIndex:slash + 1] intValue];
        Fraction *fraction = [[Fraction alloc] initWithNumerator:numerator
                                                  andDenominator:denominator];
        [_stack push:fraction];
        [_stack print];
    }
    else if ([input hasPrefix:@"pop"])
    {
        [_stack pop];
        [_stack print];
    }
    else if ([input hasPrefix:@"clear"])
    {
        [_stack clear];
        [_stack print];
    }
    else if ([input isEqualToString:@"+"])
    {
        Fraction *fraction1 = [_stack firstOperand];
        Fraction *fraction2 = [_stack secondOperand];
        
        Fraction *result = [fraction1 add: fraction2];
        [_stack pop];
        [_stack pop];
        [_stack push: result];
        [_stack print];
    }
    else if ([input isEqualToString:@"-"])
    {
        Fraction *fraction1 = [_stack firstOperand];
        Fraction *fraction2 = [_stack secondOperand];
        
        Fraction *result = [fraction1 subtract:fraction2];
        [_stack pop];
        [_stack pop];
        [_stack push: result];
        [_stack print];
    }
    else if ([input isEqualToString:@"*"])
    {
        Fraction *fraction1 = [_stack firstOperand];
        Fraction *fraction2 = [_stack secondOperand];
        
        Fraction *result = [fraction1 multiply: fraction2];
        [_stack pop];
        [_stack pop];
        [_stack push: result];
        [_stack print];
    }
    else if ([input isEqualToString:@"/"])
    {
        Fraction *fraction1 = [_stack firstOperand];
        Fraction *fraction2 = [_stack secondOperand];
        
        Fraction *result = [fraction1 divide: fraction2];
        [_stack pop];
        [_stack pop];
        [_stack push: result];
        [_stack print];
    }
    else if ([input isEqualToString:@"invert"])
    {
        Fraction *original = [_stack topOperand];
        Fraction *inverted = [original inverse];
        [_stack pop];
        [_stack push:inverted];
        [_stack print];
    }
    
}

@end
