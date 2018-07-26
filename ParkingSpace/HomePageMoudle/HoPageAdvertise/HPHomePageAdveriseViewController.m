//
//  HPHomePageAdveriseViewController.m
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/19.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPHomePageAdveriseViewController.h"

@interface HPHomePageAdveriseViewController ()
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation HPHomePageAdveriseViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self.topRightBtn removeFromSuperview];
    [self.view addSubview:self.topRightBtn];
    self.topRightBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.topRightBtn.layer.borderWidth =1.0;
    self.topRightBtn.layer.cornerRadius = 20.0;
    self.topRightBtn.clipsToBounds = YES;
    [self addTopRightBtnContains];
    self.topLefttBtn.hidden = YES;
    
    self.cardView.cardBackView.layer.cornerRadius = 10.0;
    self.cardView.shadowLayer.cornerRadius = 10.0;

    self.bottomMiddleBtn.backgroundColor = [UIColor blueColor];
    [self.bottomMiddleBtn setTitle:@"立即查看" forState:UIControlStateNormal];
    [self.bottomMiddleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.bottomMiddleBtn.layer.cornerRadius = 45/2.0;

    self.bottomMiddleBtn.clipsToBounds = YES;
    [self.bottomMiddleBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self addBottomMiddleBtnContains];
    
    UIImage * closedImage = [UIImage imageNamed:@"黑叉叉"];
    
    
    closedImage = [closedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.topRightBtn.tintColor = [UIColor whiteColor];
   
    [self.topRightBtn setImage:closedImage forState:UIControlStateNormal];
    

    self.line = [UIView new];
    self.line.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.line];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardView.mas_bottom);
        make.bottom.equalTo(self.topRightBtn.mas_top);
        make.centerX.equalTo(self.cardView);
        make.width.equalTo(@(1));
        
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
            make.bottom.equalTo(self.cardView).offset(-42);
            make.height.equalTo(@(45));
            make.width.equalTo(@(100));
        }];
    }
}

-(void)addTopRightBtnContains
{
    if (self.topRightBtn)
    {
        [self.topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cardView.mas_bottom).offset(40);
            make.centerX.equalTo(self.cardView);
            make.height.width.equalTo(@(30));
        }];
    }
}

-(void)topRightBtnActon:(UIButton *)sender
{
    [UIView animateWithDuration:0.15 animations:^{
        self.cardView.alpha = 0.0;
        self.topRightBtn.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        [self dismissViewControllerAnimated:NO completion:^{
            
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
