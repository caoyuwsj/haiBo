//
//  HPTools.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPTools.h"

@implementation HPTools
+(BOOL)isCurrentLanguageIsChiniese
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog ( @"%@" , currentLanguage);
    if ([currentLanguage isEqualToString:@"zh-Hant"] ||
        [currentLanguage isEqualToString:@"zh-Hans"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}
@end
