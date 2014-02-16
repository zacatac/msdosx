//
//  ZFChatBot.m
//  ChatBot
//
//  Created by Zack Field on 2/16/14.
//
//

#import "ZFChatBot.h"

@implementation ZFChatBot
@synthesize rememberedString;

+ (NSString *)screenName
{
    return @"Zackbot";
}

- (void) respondToChatMessage:(NSString *) chatMessage
{
    if ([chatMessage isEqualToString:@"hello"]){
        [self sendMessage:@"hello"];
    }
    else if ([chatMessage isEqualToString:@"date"])
    {
        [self sendMessage:[[NSDate date] description]];
    }
    else if ([chatMessage hasPrefix:@"remember"])
    {
        NSUInteger startOfRemember = [chatMessage rangeOfString:@"remember"].location;
        NSString *afterRemember = [chatMessage substringFromIndex:startOfRemember +
                                   [@"remember" length]
                                   + 1];
        rememberedString = [afterRemember retain];
    }
    else if ([chatMessage isEqualToString:@"recall"])
    {
        [self sendMessage:rememberedString];
    }
    else if ([chatMessage hasPrefix:@"timer"])
    {
        NSUInteger startOfTimer = [chatMessage rangeOfString:@"timer"].location + [@"timer" length] + 1;
        NSString *stringInterval = [chatMessage substringFromIndex:startOfTimer];
        [NSTimer scheduledTimerWithTimeInterval:[stringInterval floatValue]
                                         target:self
                                       selector:@selector(timerTriggered:)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (void) timerTriggered: (NSTimer *) timer
{
    [self sendMessage:@"ding!"];
}
@end
