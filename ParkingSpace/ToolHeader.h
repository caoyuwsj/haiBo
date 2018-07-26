//
//  ToolHeader.h
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/11.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#ifndef ToolHeader_h
#define ToolHeader_h



#import "User.h"
#import "MyButton.h"
#import "NSString+Trims.h"
#import "NSString+method.h"
#import "UIButton+CountDown.h"
#import "MJCountDownButton.h"
#import "BlocksKit+UIKit.h"
#import "GXBaseViewController.h"
#import "GXBaseTableViewController.h"
#import "GXNetWorking.h"
#import "MyButtonSmall.h"
#import "UIView+Toast.h"
#import "MJExtension.h"
//#define TEST




#define TOAST(msg) [self.view makeToast:msg]

// 是否大于等于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
// 是否大于等于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
// 是否iPad
#define isiPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define kFontSize(size) [UIFont systemFontOfSize:size]


#define IMGSELECT [UIImage imageNamed:@"22"]
#define IMGUNSELECT [UIImage imageNamed:@"圈"]
/*
 广告常量表示
 */
static NSString* const NotificationContants_Advertise_Key=@"AdvertisePush";

//百度地图SDK的Key
#define  kBaiduMapKey @"20TTpXTnnp8TodtDXWjZBOvP"
//系统版本号
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]


#define CURRUNT_VC \
^(){\
    UIViewController *result = nil;\
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];\
    if (window.windowLevel != UIWindowLevelNormal)\
    {\
        NSArray *windows = [[UIApplication sharedApplication] windows];\
        for(UIWindow * tmpWin in windows){\
            if (tmpWin.windowLevel == UIWindowLevelNormal){\
                window = tmpWin;\
                break;\
            }\
        }\
    }\
    UIView *frontView = [[window subviews] objectAtIndex:0];\
    id nextResponder = [frontView nextResponder];\
    if ([nextResponder isKindOfClass:[UIViewController class]]) {\
        result = nextResponder;\
    } else {\
        result = window.rootViewController;\
    }\
    return result;\
}()\

#endif /* ToolHeader_h */
