//
//  HPSJSySActionView.h
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
// 首页带弧线扫一扫View

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "HPSJSysActionBackView.h"
@class HPSJSySActionView;
@protocol HPSJSySActionViewDelegate <NSObject>

@optional
- (void)HPSJSySActionView:(HPSJSySActionView *)view scanBtnClick:(UIButton *)sender;


@end
@interface HPSJSySActionView : UIView
//带弧线背景
@property (nonatomic, strong) HPSJSysActionBackView * backView;
//按钮
@property (nonatomic, strong) UIButton * actionBtn;
//按钮说明
@property (nonatomic, strong) UILabel * actionTitleLabel;

@property (nonatomic, weak) id<HPSJSySActionViewDelegate> delegate;


@end
