//
//  AppDelegate.h
//  ParkingSpace
//
//  Created by ArthurShuai on 2017/3/2.
//  Copyright © 2017年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSRouter+AppDelegate.h"
#import "SJMainTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) SJMainTabBarViewController * maintabBar;



-(NSString *)showText:(NSString *)key;  //用来替代以往的 NSString 方法

@end

