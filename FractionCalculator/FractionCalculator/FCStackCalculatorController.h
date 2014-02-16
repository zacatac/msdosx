//
//  FCStackCalculatorController.h
//  FractionCalculator
//
//  Created by Zack Field on 2/4/14.
//
//

#import <Foundation/Foundation.h>
#import "FCStack.h"
#import "FCConsole.h"
#import "Fraction.h"

@interface FCStackCalculatorController : NSObject
{

}

@property (retain) FCStack *stack;

- (void) respondToInput: (NSString *) input;


@end
