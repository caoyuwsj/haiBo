//
//  SJMainTabBarViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SJMainTabBarViewController.h"
#import "HPHomePageViewController.h"
#import "HPSJFindParkPageViewController.h"
#import "HPSJServicePageViewController.h"

@interface SJMainTabBarViewController ()

@property (nonatomic, strong) HPHomePageViewController * homePageVc;
@property (nonatomic, strong) HPSJFindParkPageViewController * finParkVc;
@property (nonatomic, strong) HPSJServicePageViewController * serviceVc;

@property (nonatomic, strong) LSRootNavigationController* mine;

@end

@implementation SJMainTabBarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //切换语言通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localLanguageChangedToRefreshUI) name:ChangeLang object:nil];

    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    LSRootNavigationController* mine = [loginStoryboard instantiateViewControllerWithIdentifier:@"NavMine"];
    [self initNav:mine];
    mine.tabBarItem.image = [UIImage imageNamed:@"我的"];
    self.mine = mine;
    mine.tabBarItem.selectedImage = [UIImage imageNamed:@"我的"];//icon_mine_press
    mine.transferNavigationBarAttributes = NO;

    self.homePageVc = [HPHomePageViewController new];

    UIImage *img = [UIImage imageNamed:@"首页-选中"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.homePageVc.tabBarItem.image = img;

    UIImage *selectImg = [UIImage imageNamed:@"首页-选中"];
    selectImg = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.homePageVc.tabBarItem.selectedImage = selectImg;

    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:self.homePageVc];

//    homeNav.transferNavigationBarAttributes = YES;
//    homeNav.navigationBar.barTintColor = [UIColor colorWithHexString:@"#FCDE11"];
    homeNav.navigationBar.barTintColor = [UIColor whiteColor];

    self.finParkVc = [HPSJFindParkPageViewController new];
    self.finParkVc.tabBarItem.selectedImage = [UIImage imageNamed:@"寻找车位"];
    
    self.finParkVc.tabBarItem.image = [UIImage imageNamed:@"寻找车位"];
    LSRootNavigationController * findNav = [[LSRootNavigationController alloc] initWithRootViewController:self.finParkVc];

    findNav.navigationBar.translucent = NO;
    findNav.navigationBar.tintColor = [UIColor colorWithHexString:@"#FCDE11"];

    self.serviceVc = [HPSJServicePageViewController new];
    self.serviceVc.tabBarItem.selectedImage = [UIImage imageNamed:@"服务-默认"];
    self.serviceVc.tabBarItem.image = [UIImage imageNamed:@"服务-默认"];
    LSRootNavigationController * seviceNav = [[LSRootNavigationController alloc] initWithRootViewController:self.serviceVc];

    seviceNav.navigationBar.translucent = NO;
    seviceNav.navigationBar.tintColor = [UIColor colorWithHexString:@"#FCDE11"];

    self.homePageVc.title = CustomStr(@"首页");
    self.finParkVc.title = CustomStr(@"寻找车位");
    self.serviceVc.title = CustomStr(@"服务");
    self.mine.title = CustomStr(@"我的");
    self.viewControllers = @[homeNav,findNav,seviceNav,mine];

    
}

-(void)initNav:(LSRootNavigationController*)mine
{
    mine.navigationBar.translucent = NO;
//    mine.navigationBar.barTintColor =DEFAULT_COLOR;// ColorWithRGB(236, 188, 43, 1);
    mine.navigationBar.tintColor = [UIColor blackColor];
    mine.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)localLanguageChangedToRefreshUI
{
    self.homePageVc.title = CustomStr(@"首页");
    self.finParkVc.title = CustomStr(@"寻找车位");
    self.serviceVc.title = CustomStr(@"服务");
    self.mine.title = CustomStr(@"我的");
}

@end
