//
//  HPHomePageScanOverTimeViewController.m
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/19.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPHomePageScanOverTimeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface HPHomePageScanOverTimeViewController ()

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * messageLabel;

//输入框背景
@property (nonatomic, strong) UIView * inputBackView;
@property (nonatomic, strong) UITextField * inputField;
@end

@implementation HPHomePageScanOverTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.bottomMiddleBtn removeFromSuperview];
    [self.view addSubview:self.bottomMiddleBtn];
    [self addBottomMiddleBtnContains];
    [self.bottomMiddleBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self.bottomMiddleBtn setImage:[UIImage imageNamed:@"去"] forState:UIControlStateNormal];
    self.topTitleLabel.text = nil;


    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"超时"];
    [self.cardView addSubview:self.imageView];

    self.messageLabel = [UILabel new];
    self.messageLabel.font = kFontSize(18);
    self.messageLabel.textColor = [UIColor colorWithHexString:@"#4D4D4D"];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.text = @"扫码超时";
    [self.cardView addSubview:self.messageLabel];


    self.inputBackView = [[UIView alloc] initWithFrame:CGRectMake(40, 75, SCREEN_WIDTH - 80, 45)];
    self.inputBackView.layer.cornerRadius = 22.5;
    self.inputBackView.layer.borderColor = [UIColor colorWithHexString:@"#DBCC14"].CGColor;
    self.inputBackView.layer.borderWidth = 1.3;
    self.inputBackView.clipsToBounds = YES;
    self.inputBackView.userInteractionEnabled = YES;
    [self.cardView addSubview:self.inputBackView];


    self.inputField = [[UITextField alloc] init];
    self.inputField.frame = CGRectMake(20, 0, SCREEN_WIDTH - 120, 40);
    self.inputField.placeholder = @"请输入车位号";
    [self.inputBackView addSubview:self.inputField];


    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topTitleLabel.mas_bottom).offset(16);
        make.centerX.equalTo(self.cardView);
        make.width.equalTo(@(84));
        make.height.equalTo(@(80));
    }];

    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(26);
        make.centerX.equalTo(self.cardView);
        make.height.equalTo(@(25));
    }];

    [self.inputBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(28);
        make.left.equalTo(self.cardView).offset(24);
        make.right.equalTo(self.cardView).offset(-24);
        make.centerX.equalTo(self.cardView);
        make.height.equalTo(@(45));
    }];

    [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputBackView);
        make.left.equalTo(self.inputBackView).offset(20);
        make.right.equalTo(self.inputBackView).offset(-20);
        make.height.equalTo(@(45));
    }];

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
            make.centerY.equalTo(self.cardView.mas_bottom);
            make.height.equalTo(@(65));
            make.width.equalTo(@(65));
        }];
    }
}

-(void)addCardViewContains
{
    if (self.cardView)
    {
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset((SCREEN_HEIGHT-(SCREEN_WIDTH - 100))/2-50 - 20);
            make.width.equalTo(@(SCREEN_WIDTH - 60));
            make.centerX.equalTo(self.view);
            make.height.equalTo(@(326));
        }];
    }
}

-(void)topRightBtnActon:(UIButton *)sender
{

    [UIView animateWithDuration:0.15 animations:^{
        self.cardView.alpha = 0.0;
        self.bottomMiddleBtn.alpha = 0.0;
    } completion:^(BOOL finished) {

        [self dismissViewControllerAnimated:NO completion:^{

        }];
    }];
}

-(void)topLefttBtnActon:(UIButton *)sender
{
    sender.selected = !sender.selected;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    if ([device hasTorch]) {
        if (sender.selected) {
            //调用led闪光灯
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOn];
        } else {
            //关闭闪光灯
            if (device.torchMode == AVCaptureTorchModeOn) {
                [device setTorchMode: AVCaptureTorchModeOff];
            }
        }
    }
}


@end
