//
//  HPBaseAltActionViewController.h
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/19.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

// 通用型警告卡片  默认带有 上部标题，上左按钮，上右按钮 下部操作按钮。响应事件重写方法就OK

#import "HPBaseViewController.h"
#define topMagin 8
#define leftMagin 8
#define topBtnWidth 32
@interface HPBaseAltActionViewController : HPBaseViewController

@property (nonatomic, strong) HPBaseCardView * cardView; //卡片

@property (nonatomic, strong) UIButton * topLefttBtn; //左上角按钮
@property (nonatomic, strong) UIButton * topRightBtn; //右上角按钮
@property (nonatomic, strong) UILabel * topTitleLabel; //标题
@property (nonatomic, strong) UIButton * bottomMiddleBtn; //中下按钮

/**
 卡片约束
 */
-(void)addCardViewContains;
/**
 顶部标题约束
 */
-(void)addTopTitleLabelContains;

/**
 右上角约束
 */
-(void)addTopRightBtnContains;

/**
 左上角约束
 */
-(void)addTopLeftBtnContains;
/**
 中底部按钮约束
 */
-(void)addBottomMiddleBtnContains;




-(void)topLefttBtnActon:(UIButton *)sender;

-(void)topRightBtnActon:(UIButton *)sender;

-(void)bottomMiddleBtnActon:(UIButton *)sender;

@end
