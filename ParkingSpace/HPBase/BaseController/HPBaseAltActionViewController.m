//
//  HPBaseAltActionViewController.m
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/19.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBaseAltActionViewController.h"


@interface HPBaseAltActionViewController ()

@end

@implementation HPBaseAltActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sj_initDefaultSubViews];
}

-(void)sj_initDefaultSubViews
{
    self.cardView = [HPBaseCardView new];
    self.cardView.cardBackView.layer.cornerRadius = 8.0;
    self.cardView.shadowLayer.cornerRadius = 8.0;
    [self.view addSubview:self.cardView];
    [self addCardViewContains];

    self.topTitleLabel = [UILabel new];
    self.topTitleLabel.font = kFontSize(15);
    self.topTitleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.topTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.cardView addSubview:self.topTitleLabel];
    [self addTopTitleLabelContains];


    self.topLefttBtn = [UIButton new];
    [self.topLefttBtn addTarget:self action:@selector(topLefttBtnActon:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLefttBtn setImage:[UIImage imageNamed:@"手电筒"] forState:UIControlStateNormal];
    [self.cardView addSubview:self.topLefttBtn];
    [self addTopLeftBtnContains];

    self.topRightBtn = [UIButton new];
    [self.topRightBtn addTarget:self action:@selector(topRightBtnActon:) forControlEvents:UIControlEventTouchUpInside];
    [self.topRightBtn setImage:[UIImage imageNamed:@"黑叉叉"] forState:UIControlStateNormal];
    [self.cardView addSubview:self.topRightBtn];
    [self addTopRightBtnContains];

    self.bottomMiddleBtn = [UIButton new];
    self.bottomMiddleBtn.titleLabel.font = kFontSize(16);
    [self.bottomMiddleBtn setTitleColor:[UIColor colorWithHexString:@"#463609"] forState:UIControlStateNormal];
    [self.bottomMiddleBtn addTarget:self action:@selector(bottomMiddleBtnActon:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomMiddleBtn setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateNormal];
    [self.cardView addSubview:self.bottomMiddleBtn];
    [self addBottomMiddleBtnContains];
}
/**
 卡片约束
 */
-(void)addCardViewContains
{
    if (self.cardView)
    {
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.equalTo(@(SCREEN_WIDTH - 60));
            make.height.equalTo(@(256));
        }];
    }
}
/**
 左上角约束
 */
-(void)addTopLeftBtnContains
{
    if (self.topLefttBtn && self.cardView)
    {
        [self.topLefttBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cardView).offset(leftMagin);
            make.top.equalTo(self.cardView).offset(topMagin);
            make.height.width.equalTo(@(topBtnWidth));
        }];
    }
}
/**
 右上角约束
 */
-(void)addTopRightBtnContains
{
    if (self.topRightBtn  && self.cardView)
    {
        [self.topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cardView).offset(-leftMagin);
            make.top.equalTo(self.cardView).offset(topMagin);
            make.height.width.equalTo(@(topBtnWidth));
        }];
    }
}
/**
 顶部标题约束
 */
-(void)addTopTitleLabelContains
{
    if (self.topTitleLabel && self.cardView)
    {
        [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.cardView);
            make.top.equalTo(self.cardView).offset(topMagin);
            make.height.equalTo(@(topBtnWidth));
        }];
    }
}
/**
 中底部按钮约束
 */
-(void)addBottomMiddleBtnContains
{
    if (self.bottomMiddleBtn && self.cardView)
    {
        [self.bottomMiddleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.cardView);
            make.bottom.equalTo(self.cardView).offset(-42);
            make.height.equalTo(@(45));
        }];
    }
}

/**
 左上方按钮响应

 @param sender
 */
-(void)topLefttBtnActon:(UIButton *)sender
{

}
/**
 右上方按钮响应
  默认响应关闭事件
 @param sender
 */
-(void)topRightBtnActon:(UIButton *)sender
{
    [UIView animateWithDuration:0.15 animations:^{
        self.cardView.alpha = 0.0;
    } completion:^(BOOL finished) {

        [self dismissViewControllerAnimated:NO completion:^{

        }];
    }];
}
/**
 下中方按钮响应

 @param sender
 */
-(void)bottomMiddleBtnActon:(UIButton *)sender
{

}
@end
