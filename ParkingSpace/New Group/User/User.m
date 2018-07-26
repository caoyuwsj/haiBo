//
//  User.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/3.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "User.h"

@implementation User


+ (instancetype)sharedInstance
{
    static User *user;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[self alloc] init];
        user.loginWithPhone = YES;
    });
    return user;
}

@end
