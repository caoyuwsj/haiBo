//
//  HPSJSySActionView.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
// 首页带弧线扫一扫View

#import "HPSJSySActionView.h"

@implementation HPSJSySActionView
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
    [self addSubview:self.backView];
    
    self.actionBtn = [UIButton new];
    [self.actionBtn setBackgroundImage:[UIImage imageNamed:@"扫码停车图标"] forState:UIControlStateNormal];
    
    [self.actionBtn addTarget:self action:@selector(scanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.actionBtn];

    UILabel * lab = [UILabel new];
    lab.text = @"扫码停车";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor colorWithHexString:@"#333333"];
    lab.frame = CGRectMake(0, 75, 135, 22);
    lab.font = kFontSize(15);
    [self.actionBtn addSubview:lab];

    self.actionBtn.frame = CGRectMake(SCREEN_WIDTH/2.0 - 66.5, 45, 135, 144);

}

-(void)scanBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(HPSJSySActionView:scanBtnClick:)])
    {
        [self.delegate HPSJSySActionView:self scanBtnClick:sender];
    }
}
@end
