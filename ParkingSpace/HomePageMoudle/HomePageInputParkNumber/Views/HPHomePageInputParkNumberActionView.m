//
//  HPHomePageInputParkNumberActionView.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageInputParkNumberActionView.h"

@implementation HPHomePageInputParkNumberActionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sj_initSubViews];
    }
    return self;
}
-(void)sj_initSubViews
{
    self.backView = [[HPSJSysActionBackView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    self.backView.userInteractionEnabled = YES;
    [self addSubview:self.backView];

    self.inputBackView = [[UIView alloc] initWithFrame:CGRectMake(40, 75, SCREEN_WIDTH - 80, 45)];
    self.inputBackView.layer.cornerRadius = 22.5;
    self.inputBackView.layer.borderColor = [UIColor colorWithHexString:@"#DBCC14"].CGColor;
    self.inputBackView.layer.borderWidth = 1.3;
    self.inputBackView.clipsToBounds = YES;
    self.inputBackView.userInteractionEnabled = YES;
    [self.backView addSubview:self.inputBackView];

    self.inputTexField = [[UITextField alloc] init];
    self.inputTexField.frame = CGRectMake(22.5, 0, SCREEN_WIDTH - 125, 45);
    self.inputTexField.placeholder = @"请输入车位号";
    [self.inputBackView addSubview:self.inputTexField];


    self.actionBtn  = [UIButton new];
    self.actionBtn.frame  =CGRectMake(40, 75 + 45 +32, SCREEN_WIDTH - 80, 45);

    self.actionBtn.layer.cornerRadius = 22.5;
    self.actionBtn.clipsToBounds = YES;
    
    [self.actionBtn setBackgroundImage:[UIImage imageNamed:@"灰色渐变"] forState:UIControlStateNormal];
    [self.actionBtn setTitle:@"开始停车" forState:UIControlStateNormal];
    [self.backView addSubview:self.actionBtn];
    [self.actionBtn addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)actionBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(HPHomePageInputParkNumberActionView:nextBtnClick:)])
    {
        [self.delegate HPHomePageInputParkNumberActionView:self nextBtnClick:sender];
    }
}


@end
