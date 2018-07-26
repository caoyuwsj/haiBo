//
//  AppDelegate.m
//  ParkingSpace
//
//  Created by ArthurShuai on 2017/3/2.
//  Copyright © 2017年 ArthurShuai. All rights reserved.
//

#import "AppDelegate.h"

#import "WXApiManager.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate ()<BMKGeneralDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [LSRouter app:application didFinishLaunchingWithOptions:launchOptions];
    
   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [LSRouter appWillResignActive:application];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [LSRouter appDidEnterBackground:application];
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [LSRouter appWillEnterForeground:application];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [LSRouter appDidBecomeActive:application];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    [LSRouter appWillTerminate:application];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}


-(NSString *)showText:(NSString *)key
{
    NSString *lan = @"zh-Hans";
    if (!kGetLocalLang || [kGetLocalLang length] < 1)
    {
        lan = @"zh-Hans";
    }
    else
    {
        lan = [kGetLocalLang isEqualToString:@"zh_CN"] ? @"zh-Hans" : @"en";
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:lan ofType:@"lproj"];
    
    return [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:@"Language"];
}
@end
