//
//  NSString+method.m
//  WordPay
//
//  Created by gong xiang on 17/2/23.
//  Copyright © 2017年 com.szzcs. All rights reserved.
//

#import "NSString+method.h"
#import <CommonCrypto/CommonCrypto.h>

#define kPHONE_REGEX     @"1[0-9]{10}$"//手机号码格式检测



@implementation NSString (method)



/**
 *	@brief	忽略大小写的正则匹配
 *
 *	@param 	regex [IN]	正则表达式
 *
 *	@return	number of matches of the regular expression
 */
- (NSUInteger)validateCaseInsensitive:(NSString *)regex
{
    NSError *error = nil;
    NSUInteger res = 0;
    
    if (nil == regex || 0 == regex.length)
    {
        return res;
    }
    
    NSRegularExpression *regExpression = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                   options:NSRegularExpressionCaseInsensitive
                                                                                     error:&error];
    
    if (nil != error)
    {
        NSLog(@"NSError from Regular Expression: %@", error);
    }
    else
    {
        res = [regExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    }
    
    return res;
}

+ (BOOL)checkMobilePhoneNumber:(NSString*)phoneNumber
{
    if (nil == phoneNumber) {
        return  NO;
    }
    
    NSString *mobilePhoneRegex = kPHONE_REGEX;
    NSUInteger phoneType = 0;
    phoneType = [phoneNumber validateCaseInsensitive:mobilePhoneRegex];
    if (0 == phoneType) {
        return NO;
    }
    return YES;
}



#pragma mark -- 判断参数为nil方法 --
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
} 

- (BOOL) isBlankString {
    if (self == nil || self == NULL) {
        return YES;
    }
    
    if(self.length <1)
        return YES;
    
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
} 

- (id)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}


+(id)checkEmpty:(id)obj
{
    
    if ([NSString isBlankString:obj]) {
        return @"null";
    }
    else
        return obj;
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}



-(id)yuanValue 
{
    return [NSString stringWithFormat:@"%0.2f",[self floatValue]/100];
}

-(id)fenValue
{
    return [NSString stringWithFormat:@"%.0f",[self  floatValue]*100];
}

-(id)timeStr
{
    NSString* year = [self substringWithRange:NSMakeRange(0,4)]  ;
    NSString* month = [self substringWithRange:NSMakeRange(4,2)] ;
    NSString* date = [self substringWithRange:NSMakeRange(6,2)]  ;
    
    return [NSString stringWithFormat:@"%@-%@-%@",year,month,date];
}
-(id)timeStrEx
{
    NSString* year = [self substringWithRange:NSMakeRange(0,4)]  ;
    NSString* month = [self substringWithRange:NSMakeRange(4,2)] ;
    NSString* date = [self substringWithRange:NSMakeRange(6,2)]  ;
    
    NSString* hour = [self substringWithRange:NSMakeRange(8,2)]  ;
    NSString* min = [self substringWithRange:NSMakeRange(10,2)]  ;
    NSString* sec = [self substringWithRange:NSMakeRange(12,2)]  ;
    
    return [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@",year,month,date,hour,min,sec];
}
- (BOOL)isNum {
    NSString *checkedNumString = self;
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}

- (BOOL)isMobilePhoneNumber
{
    NSString* mobile = self;
    if (mobile.length != 11)
        
    {
        
        return NO;
        
    }
    
    /**
     
     * 手机号码:
     
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     
     * 电信号段: 133,149,153,170,173,177,180,181,189
     
     */
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    
    /**
     
     * 中国移动：China Mobile
     
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     
     */
    
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    
    /**
     
     * 中国联通：China Unicom
     
     * 130,131,132,145,155,156,170,171,175,176,185,186
     
     */
    
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    
    /**
     
     * 中国电信：China Telecom
     
     * 133,149,153,170,173,177,180,181,189
     
     */
    
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    
    
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    
    
    if (([regextestmobile evaluateWithObject:mobile] == YES)
        
        || ([regextestcm evaluateWithObject:mobile] == YES)
        
        || ([regextestct evaluateWithObject:mobile] == YES)
        
        || ([regextestcu evaluateWithObject:mobile] == YES))
        
    {
        
        return YES;
        
    }
    
    else
        
    {
        
        return NO;
        
    }
}
//{
//    NSString* phoneNumber = [NSString new];
//    phoneNumber = self;
//    if (nil == phoneNumber) {
//        return  NO;
//    }
//
//    NSString *mobilePhoneRegex = kPHONE_REGEX;
//    NSUInteger phoneType = 0;
//    phoneType = [phoneNumber validateCaseInsensitive:mobilePhoneRegex];
//    if (0 == phoneType) {
//        return NO;
//    }
//    return YES;
//}

-(BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
@end
