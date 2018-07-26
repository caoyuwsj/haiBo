//
//  LSRouter+API.h
//  ParkingSpace
//
//  Created by ArthurShuai on 2018/1/19.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
//  文档名称：网络接口配置
//  功能描述：网络接口配置

#ifndef LSRouter_API_h
#define LSRouter_API_h

static NSString * const BaseUrl = @"http://120.77.146.212/hispeed/test/public/api.php/carmaster/v1.0/";
//static NSString * const BaseUrl =  @"https://park.szqusu.com/api.php/carmaster/v1.0/";
#define GetUrl(api) [BaseUrl stringByAppendingString:api]

/******配置接口******/



//登录
#define API_Login GetUrl(@"login")

//实名认证
#define API_RealName GetUrl(@"carmaster/setIdInfo")

//跟新个人信息
#define API_UpdateInfo GetUrl(@"carmaster/setinfo")

//获取图片验证码
#define API_GetImgCode GetUrl(@"carmaster/getimgcode");

//发送验证码到手机/邮箱
#define API_SendCode GetUrl(@"carmaster/sendcode")

//获取个人信息
#define API_GetPersonalInfo GetUrl(@"carmaster/getinfo")


#endif /* LSRouter_API_h */
