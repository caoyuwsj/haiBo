//
//  HPBaseViewController.h
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LSRootNavigationController/LSRootNavigationController.h>

@interface HPBaseViewController : UIViewController


/**
 设置界面nav的右侧按钮图片名称

 @param imageName 图片名称字符串
 */
-(void)setNavRightBarItemWithImageName:(NSString *)imageName;

/**
 设置界面nav的右侧按钮图片标题

 @param titleName 标题
 */
-(void)setNavRightBarItemWithTitleName:(NSString *)titleName;


/**
 设置界面Nav返回按钮图片名称

 @param imageName 图片名
 */
-(void)setNavBarBackItemWithImageName:(NSString *)imageName;


/**
 nav右侧按钮点击相应

 @param sender 按钮
 */
-(void)rightBarItemAction:(UIBarButtonItem *)sender;

/**
 语言切换 需要变更语言刷新UI
 */
-(void)localLanguageChangedToRefreshUI;


@end
