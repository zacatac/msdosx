//
//  ZFChatBot.h
//  ChatBot
//
//  Created by Zack Field on 2/16/14.
//
//

#import <Foundation/Foundation.h>
#import "CBChatBot.h"

@interface ZFChatBot : CBChatBot{}
@property (retain) NSString* rememberedString;

+ (NSString*) screenName;

- (void) respondToChatMessage:(NSString *) chatMessage;
@end
