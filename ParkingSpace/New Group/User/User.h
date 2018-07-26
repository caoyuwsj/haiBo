//
//  User.h
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/3.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalInfo.h"

@interface User : NSObject

/*
 判断是否用手机号登录  默认是YES
 */
@property (assign , nonatomic) BOOL loginWithPhone;

/*
 
 */
@property (strong , nonatomic) NSString* latitude;
@property (strong , nonatomic) NSString* longitude;

//
@property (strong , nonatomic) PersonalInfo* person;

//登录获取的userkey
@property (strong , nonatomic) NSString* userkey;

//用户sid
@property (strong , nonatomic) NSString* sid;

//用户邮箱
@property (strong , nonatomic) NSString* email;

//用户手机
@property (strong , nonatomic) NSString* phoneNo;

//用户昵称
@property (strong, nonatomic) NSString* userName;

//Y用户头像
@property (strong , nonatomic) UIImage* imgHead;
+ (instancetype)sharedInstance;
@end
