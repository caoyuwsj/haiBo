//
//  HPSJVerticalSegmenView.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJVerticalSegmenView.h"

@implementation HPSJVerticalSegmenView

-(instancetype)initWithFrame:(CGRect)frame actionTitleArray:(NSArray *)actionTitleArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.cardBackView.layer.cornerRadius = 8.0 ;
        self.shadowLayer.cornerRadius = 8.0;
        
        
        self.actionTitleArray = actionTitleArray;
        CGFloat btnW = frame.size.width;
        CGFloat btnH = frame.size.height/(actionTitleArray.count/1.0);
        self.cardBackView.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i = 0 ; i<actionTitleArray.count; i++)
        {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, btnH * i + 2, btnW, btnH)];
            
            btn.titleLabel.font = kFontSize(15);
            
            [btn setTitle:actionTitleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = i + 100;
            [btn addTarget:self action:@selector(segmentViewSelect:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if (i != actionTitleArray.count -1)
            {
                UIView * line = [UIView new];
                line.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
                [self addSubview:line];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(btn);
                    make.right.equalTo(btn).offset(-11);
                    make.left.equalTo(btn).offset(11);
                    make.height.equalTo(@(1));
                }];
            }
        }
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame actionImageArray:(NSArray *)actionIamgeArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.cardBackView.layer.cornerRadius = 8.0 ;
        self.shadowLayer.cornerRadius = 8.0;
        
        
        self.actionImageArray = actionIamgeArray;
        CGFloat btnW = frame.size.width;
        CGFloat btnH = frame.size.height/(actionIamgeArray.count/1.0);
        self.cardBackView.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i = 0 ; i<actionIamgeArray.count; i++)
        {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, btnH * i + 2, btnW, btnH)];
            
            btn.titleLabel.font = kFontSize(15);
            
            [btn setImage:[UIImage imageNamed:actionIamgeArray[i]] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHexString:@"#FCDE11"] forState:UIControlStateSelected];
            btn.tag = i + 100;
            [btn addTarget:self action:@selector(segmentViewSelect:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if (i != actionIamgeArray.count -1)
            {
                UIView * line = [UIView new];
                line.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
                [self addSubview:line];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(btn);
                    make.right.equalTo(btn).offset(-11);
                    make.left.equalTo(btn).offset(11);
                    make.height.equalTo(@(1));
                }];
            }
        }
        
    }
    return self;
}






-(void)segmentViewSelect:(UIButton *)sender
{
    for (UIView * btn in self.subviews)
    {
        if ([btn isKindOfClass:[UIButton class]])
        {
            UIButton * butto = (UIButton *)btn;
            butto.selected = NO;
        }
    }
    NSInteger index = sender.tag - 100;
    sender.selected = YES;
    if ([self.delegate respondsToSelector:@selector(segmenView:selectIndex:)])
    {
        [self.delegate segmenView:self selectIndex:index];
    }
    
}
-(void)localLanguageChangedToRefreshUI
{
    for (UIView * vie in self.subviews)
    {
        if ([vie isKindOfClass:[UIButton class]])
        {
            UIButton * btn = (UIButton *)vie;
            NSString * title = btn.titleLabel.text;
            NSString * lanTitle = CustomStr(title);
            [btn setTitle:lanTitle forState:UIControlStateNormal];
        }
    }
}

@end
