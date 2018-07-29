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
        self.backgroundColor = [UIColor clearColor];
        [self sj_initSubViews];
    }
    return self;
}
-(void)sj_initSubViews
{
    self.backView = [[HPSJSysActionBackView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    [self addSubview:self.backView];
    self.backgroundColor = [UIColor clearColor];
    self.backView.backgroundColor = [UIColor clearColor];
    
    self.panchUpBtn = [UIButton new];
    [self.panchUpBtn setImage:[UIImage imageNamed:@"上上三角"] forState:UIControlStateNormal];
    
    [self.panchUpBtn addTarget:self action:@selector(panchUpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.panchUpBtn];
    
    
    self.userTimeLabel = [UILabel new];
    self.userTimeLabel.text = @"11:03:34";
    self.userTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.userTimeLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.userTimeLabel.font = kFontSize(30);
    [self addSubview:self.userTimeLabel];
    
    
    self.actionBtn = [UIButton new];
    [self.actionBtn setBackgroundImage:[UIImage imageNamed:@"扫码停车图标"] forState:UIControlStateNormal];
    
    [self.actionBtn addTarget:self action:@selector(scanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.actionBtn];

    self.actionTitleLabel = [UILabel new];
    self.actionTitleLabel.text = @"扫码停车";
    self.actionTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.actionTitleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.actionTitleLabel.frame = CGRectMake(0, 75, 135, 22);
    self.actionTitleLabel.font = kFontSize(15);
    [self.actionBtn addSubview:self.actionTitleLabel];

    self.actionBtn.frame = CGRectMake(SCREEN_WIDTH/2.0 - 66.5, 45, 135, 144);
    
    self.panchUpBtn.hidden = YES;
    self.userTimeLabel.hidden = YES;
    
    [self.panchUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(60);
        make.height.width.equalTo(@(24));
    }];
    
    [self.userTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(100);
    }];

}

-(void)scanBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(HPSJSySActionView:scanBtnClick:)])
    {
        [self.delegate HPSJSySActionView:self scanBtnClick:sender];
    }
}

-(void)panchUpBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(HPSJSySActionView:panchUpBtnClick:)])
    {
        [self.delegate HPSJSySActionView:self panchUpBtnClick:sender];
    }
}

-(void)setIsInUsing:(BOOL)isInUsing
{
    if (isInUsing)
    {
        [self setTimeContent];
        [self.time invalidate];
        self.time = nil;
        self.actionBtn.hidden = YES;
        self.actionTitleLabel.hidden = YES;
        self.userTimeLabel.hidden = NO;
        self.panchUpBtn.hidden = NO;
        self.time = [NSTimer scheduledTimerWithTimeInterval:1.0 block:^(NSTimer * _Nonnull timer) {
            [self setTimeContent];
        } repeats:YES];
    }
    else
    {
        [self.time invalidate];
        self.time = nil;
        self.actionBtn.hidden = NO;
        self.actionTitleLabel.hidden = NO;
        self.userTimeLabel.hidden = YES;
        self.panchUpBtn.hidden = YES;
    }

}

-(void)setTimeContent
{
    if ([kGetBeginDate isKindOfClass:[NSDate class]])
    {
        
        NSDate * beginDate = kGetBeginDate;
        NSTimeInterval ti = [[NSDate date] timeIntervalSinceDate:beginDate];
        
        long long time = ti;
        
        NSString * hourStr = time/3600 > 0 ? [NSString stringWithFormat:@"%02zd",time/3600] : @"00";
        time = time % 3600;
        NSString *minStr = time / 60 > 0 ? [NSString stringWithFormat:@"%02zd",time / 60] : @"00";
        time = time % 60;
        
        NSString * secStr = time  > 0 ? [NSString stringWithFormat:@"%02zd",time ] : @"00";
        self.userTimeLabel.text = [NSString stringWithFormat:@"%@:%@:%@",hourStr,minStr,secStr];
    }
   
}




@end
