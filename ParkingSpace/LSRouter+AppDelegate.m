//
//  LSRouter+AppDelegate.m
//  Yizsuda
//
//  Created by ArthurShuai on 2017/9/25.
//  Copyright © 2017年 ArthurShuai. All rights reserved.
//

#import "LSRouter+AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>

#import "AdvertiseHelper.h"

#import "MPLocationManager.h"

#import "IQKeyboardManager.h"
#import "WXApiManager.h"
#import "HPHomePageViewController.h"
#import "SJMainTabBarViewController.h"



@implementation LSRouter (AppDelegate)

+ (void)app:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 全局配置
    [UITableView appearance].tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    [UITableView appearance].tableFooterView = [[UIView alloc] init];
  
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    
    
    //键盘统一收回处理
    [self configureBoardManager];
    
    //初始化微信支付
    [self initWeChatSDK];

#warning 需要添加语言环境判断

    //百度地图定位
    [self startLocationWithBaiDu];
    //谷歌地图
    [GMSServices provideAPIKey:googleMapKey];

//    //进入注册页面
//    [self enterRegister];
//

    //进入主Tab页面
    [self enterMainView];
    //启动广告（记得放最后，才可以盖在页面上面）
//    [self setupAdveriseView];
}

+(void)initWeChatSDK{
    [WXApi startLogByLevel:WXLogLevelNormal logBlock:^(NSString *log) {
        NSLog(@"log : %@", log);
    }];
    //向微信注册,发起支付必须注册
    [WXApi registerApp:@"wxb4ba3c02aa476ea1" enableMTA:YES];
    
}
+(void)enterRegister
{

 
    UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UIViewController* loginVC = [loginStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    LSRootNavigationController *rootNavc = [[LSRootNavigationController alloc] initWithRootViewController:loginVC];
    [self initNav:rootNavc];
    kAppDelegate.window.rootViewController = rootNavc;
    [kAppDelegate.window makeKeyAndVisible];
 
}

/**
 进入主页
 */
+(void)enterMainView
{
    //百度地图定位
    [self startLocationWithBaiDu];
    SJMainTabBarViewController * mainTabBar = [SJMainTabBarViewController new];
    
    kAppDelegate.window.rootViewController = mainTabBar;
    [kAppDelegate.window makeKeyAndVisible];
    kAppDelegate.maintabBar = mainTabBar;
    
    
}

+(void)initNav:(LSRootNavigationController*)mine
{
    mine.navigationBar.translucent = NO;
//    mine.navigationBar.barTintColor =DEFAULT_COLOR;// ColorWithRGB(236, 188, 43, 1);
    mine.navigationBar.tintColor = [UIColor blackColor];
    mine.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
}

#pragma mark - 通知相关配置
#pragma mark 用户通知(推送) _自定义方法
+ (void)registerUserNotification {
    UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeSound |
                                    UIUserNotificationTypeBadge);
    
    UIUserNotificationSettings *settings;
    settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}
+ (void)app:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
}
+ (void)app:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"[Register Error]:%@", [error localizedDescription]);
}
+ (void)app:(UIApplication *)app performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    completionHandler(UIBackgroundFetchResultNewData);
}

+ (void)app:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    //清除角标
    app.applicationIconBadgeNumber = 0;
}

#pragma mark - others
+ (void)appWillResignActive:(UIApplication *)application
{

}
+ (void)appDidEnterBackground:(UIApplication *)application
{

}
+ (void)appWillEnterForeground:(UIApplication *)application
{
    //清除角标
    application.applicationIconBadgeNumber = 0;
}
+ (void)appDidBecomeActive:(UIApplication *)application
{

}
+ (void)appWillTerminate:(UIApplication *)application
{
    
}




#pragma mark 启动广告
+(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}

#pragma mark 百度定位
+(void)startLocationWithBaiDu{

    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager * _mapManager = [[BMKMapManager alloc]init];

    /**
     *百度地图SDK所有接口均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
     *默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
     *如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
     */
    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
        //NSLog(@"经纬度类型设置成功");
    } else {
        //NSLog(@"经纬度类型设置失败");
    }
    BOOL ret = [_mapManager start:baiduMapKey generalDelegate:self];
    if (!ret) {
        //NSLog(@"manager start failed!");
    }





    //百度地图定位
    [[MPLocationManager shareInstance] startBMKLocationWithReg:^(BMKUserLocation *loction, NSError *error) {
        if (error) {
            NSLog(@"定位失败,失败原因：%@",error);
        }
        else
        {
            NSLog(@"定位信息：%f,%f",loction.location.coordinate.latitude,loction.location.coordinate.longitude);
            USER.latitude = [NSString stringWithFormat:@"%f",loction.location.coordinate.latitude];
            USER.longitude = [NSString stringWithFormat:@"%f",loction.location.coordinate.longitude];
            CLGeocoder *geocoder=[[CLGeocoder alloc]init];
            [geocoder reverseGeocodeLocation:loction.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                
                //处理手机语言 获得城市的名称（中文）
                NSMutableArray *userDefaultLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
                NSString *currentLanguage = [userDefaultLanguages objectAtIndex:0];
                //如果不是中文 则强制先转成中文 获得后再转成默认语言
                if (![currentLanguage isEqualToString:@"zh-Hans"]&&![currentLanguage isEqualToString:@"zh-Hans-CN"]) {
                    //IOS9前后区分
                    if (isIOS9) {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans-CN", nil] forKey:@"AppleLanguages"];
                    }
                    else
                    {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans", nil] forKey:@"AppleLanguages"];
                    }
                }
                
                //转换地理信息
                if (placemarks.count>0) {
                    CLPlacemark *placemark=[placemarks objectAtIndex:0];
                    //获取城市
                    NSString *city = placemark.locality;
                    if (!city) {
                        //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                        city = placemark.administrativeArea;
                    }
                    
                    NSLog(@"百度当前城市：[%@]",city);
                    
                    // 城市名传出去后,立即 Device 语言 还原为默认的语言
                    [[NSUserDefaults standardUserDefaults] setObject:userDefaultLanguages forKey:@"AppleLanguages"];
                }
            }];
        }
    }];
    
}
#pragma mark 键盘收回管理
+(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}
@end
