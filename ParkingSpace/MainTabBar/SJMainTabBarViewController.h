//
//  SJMainTabBarViewController.h
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPHomePageViewController.h"
#import "HPSJFindParkPageViewController.h"
#import "HPSJServicePageViewController.h"


@interface SJMainTabBarViewController : UITabBarController
@property (nonatomic, strong) HPHomePageViewController * homePageVc;
@property (nonatomic, strong) HPSJFindParkPageViewController * finParkVc;
@property (nonatomic, strong) HPSJServicePageViewController * serviceVc;

@property (nonatomic, strong) LSRootNavigationController* mine;
@end
