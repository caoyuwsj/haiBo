//
//  NSString+method.h
//  WordPay
//
//  Created by gong xiang on 17/2/23.
//  Copyright © 2017年 com.szzcs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (method)

//检查电话号码是否合法
+ (BOOL)checkMobilePhoneNumber:(NSString*)phoneNumber;

//判断string是否为空
+ (BOOL) isBlankString:(NSString *)string ;
- (BOOL) isBlankString;
- (id)MD5;
+(id)checkEmpty:(id)obj;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
-(id)yuanValue;
-(id)fenValue;
-(id)timeStr;
-(id)timeStrEx;
-(BOOL)isNum;
-(BOOL)isMobilePhoneNumber;
-(BOOL)isValidateEmail;
@end
