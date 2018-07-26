//
//  LSRouter+Foundation.h
//  ParkingSpace
//
//  Created by ArthurShuai on 2018/1/5.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
//  文档名称：基础配置
//  功能描述：基础配置

#ifndef LSRouter_Foundation_h
#define LSRouter_Foundation_h

/**
 应用Apple ID
 */
static NSString * const AppleID = @"";

/**
 谷歌地图Key
 */
static NSString * const googleMapKey = @"AIzaSyCPnlfcF61gTKusOw5ns0Wu9IlznPE_q48";

/**
 百度地图Key
 */
static NSString * const baiduMapKey = @"6j3ngd2Z3yCftiN4QYW8OW29AN9ZoAIg";

/**
 Userkey
 */
#define kUserKey @"userKey"

#define   kGetUserKey  [[NSUserDefaults standardUserDefaults] objectForKey:kUserKey]

/*
    切换app语言发送通知 名字
 */
#define ChangeLang @"ChangeAppLang"

/**
 本地语言环境保存沙河字段
 */
static NSString * const kSystemLocalLang = @"SystemLocalLang";

#define   kGetLocalLang  [[NSUserDefaults standardUserDefaults] objectForKey:kSystemLocalLang]
/**
 是否使用模拟数据
 */
static BOOL USE_SIMULATE = NO;
/**
 获取plist文件模拟数据
 */
#define GET_SIMULATE_ARRAY(plistName) [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]]
#define GET_SIMULATE_DICTIONARY(plistName) [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]]

/**
 屏幕宽度
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 屏幕高度
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 应用代理对象
 */
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/**
 弱引用对象
 */
#define WeakSelf __weak typeof(self) weakSelf = self;

/**
 强引用对象
 */
#define StrongSelf __strong typeof(self) strongSelf = self;

/**
 加载本地图片
 */
#define kLoadImage(imageName,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:type == nil ? @"png" : type]]

/**
 颜色生成器

 @param rgbValue 16进制rgbValue e.g. 0xffffff
 @param alphaValue 透明度 0~1
 */
#define ColorWithValue(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

/**
 颜色生成器2
 */
#define ColorWithRGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

/*
 app主体颜色
 */
#define DEFAULT_COLOR  ColorWithRGB(236, 188, 43, 1)
/**
 当前应用版本
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 当前手机系统版本
 */
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 当前手机系统语言
 */
#define SYSTEM_LANGUAGE [NSLocale preferredLanguages].firstObject


#define isIPhone4_5                (SCREEN_WIDTH == 320)
#define isIPhone6_6s               (SCREEN_WIDTH == 375)
#define isIPhone6p_6sp             (SCREEN_WIDTH == 414)
#define isIPhoneX                  (SCREEN_HEIGHT == 812)

#define kTabBarHeight (isIPhoneX ? 83 : 49)

#define isChineseLanguage (!kGetLocalLang || [kGetLocalLang isEqualToString:@"zh_CN"])

//封装了一个宏 用来方便输入文字--实际是文字对应的key
#define CustomStr(key) [(AppDelegate *)[[UIApplication sharedApplication] delegate] showText:(key)]

/*
 全局单例
 */
#define USER [User sharedInstance]



#endif /* LSRouter_Foundation_h */
