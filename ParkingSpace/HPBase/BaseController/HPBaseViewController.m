//
//  HPBaseViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseViewController.h"

@interface HPBaseViewController ()<UINavigationControllerDelegate>

@end

@implementation HPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localLanguageChangedToRefreshUI) name:ChangeLang object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [viewController viewWillAppear:animated];
//}

/**
 设置界面nav的右侧按钮图片名称
 
 @param imageName 图片名称字符串
 */
-(void)setNavRightBarItemWithImageName:(NSString *)imageName
{
    if (self.navigationController )
    {
        if (imageName.length > 0)
        {
            UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemAction:)];
            self.navigationItem.rightBarButtonItem = rightItem;
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    else
    {
        return;
    }
}

/**
 设置界面nav的右侧按钮图片标题
 
 @param titleName 标题
 */
-(void)setNavRightBarItemWithTitleName:(NSString *)titleName
{
    if (self.navigationController )
    {
        if (titleName.length > 0)
        {
            UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:titleName style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemAction:)];
            self.navigationItem.rightBarButtonItem = rightItem;
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    else
    {
        return;
    }
}

/**
 设置界面Nav返回按钮图片名称
 
 @param imageName 图片名
 */
-(void)setNavBarBackItemWithImageName:(NSString *)imageName
{
    if (self.navigationController )
    {
        if (imageName.length > 0)
        {
            UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(backBarItemAction:)];
            [rightItem setImageInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
            self.navigationItem.backBarButtonItem = rightItem;
            //更改返回按钮填充颜色
            self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
            
            //隐藏默认的返回箭头
            self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
            self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage new];
        }
        else
        {
            self.navigationItem.backBarButtonItem = nil;
        }
    }
    else
    {
        return;
    }
    
}


-(void)rightBarItemAction:(UIBarButtonItem *)sender
{
    
}

-(void)backBarItemAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)localLanguageChangedToRefreshUI
{

}

@end
