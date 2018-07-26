//
//  HPBindCarNumberViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/17.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBindCarNumberViewController.h"
#import "HPHomeCarNumerSelectViewController.h"
#import "HPParkCostDetailViewController.h"

@interface HPBindCarNumberViewController ()

@property (nonatomic, strong) UILabel * messageLabel;

@end

@implementation HPBindCarNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bottomMiddleBtn setTitle:@"绑定车牌号" forState:UIControlStateNormal];
    [self.bottomMiddleBtn setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateNormal];

    self.topTitleLabel.text = @"提示";
    self.topLefttBtn.hidden = YES;
    self.topRightBtn.hidden = YES;

    self.messageLabel = [UILabel new];
    self.messageLabel.font = kFontSize(15);
    self.messageLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.text = @"你尚未绑定车牌号，请绑定车牌号";
    [self.cardView addSubview:self.messageLabel];

    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topTitleLabel.mas_bottom).offset(44);
        make.right.equalTo(self.cardView).offset(-16);
        make.left.equalTo(self.cardView).offset(16);
        make.height.equalTo(@(25));
    }];
    
    


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
            make.height.equalTo(@(216));
        }];
    }
}

/**
 绑定车牌号

 @param sender 按钮
 */
-(void)bottomMiddleBtnActon:(UIButton *)sender
{
//    [UIView animateWithDuration:0.15 animations:^{
//        self.cardView.alpha = 0.0;
//
//    } completion:^(BOOL finished) {
//
//        [self dismissViewControllerAnimated:NO completion:^{
//
//        }];
//    }];
    
    
    HPParkCostDetailViewController * advVc = [HPParkCostDetailViewController new];
    advVc.view.backgroundColor=[UIColor lightGrayColor];
    //关键语句，必须有
    advVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [kAppDelegate.maintabBar presentViewController:advVc animated:NO completion:^{
        advVc.view.superview.backgroundColor = [UIColor clearColor];
        [self dismissViewControllerAnimated:NO completion:^{
            
        }];
    }];
    
}



@end
