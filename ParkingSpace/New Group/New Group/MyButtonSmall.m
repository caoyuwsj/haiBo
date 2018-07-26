//
//  MyButtonSmall.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "MyButtonSmall.h"

@implementation MyButtonSmall

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [self setup];
}

-(void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//文字居中显示
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self setTintColor:[UIColor blackColor]];
    
    
    [self setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateHighlighted];
    //    [self setBackgroundImage:[UIImage imageNamed:@"jfb_btn"] forState:UIControlStateSelected];
}
+(void)setBtnStyle:(UIButton*)button
{
    //    MyButton *button = [super buttonWithType:UIButtonTypeSystem];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;//文字居中显示
    //    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [button setTitle:title forState:UIControlStateNormal];
    ;
    [button setTintColor:[UIColor whiteColor]];
    //    [button setBackgroundColor:[UIColor colorWithRed:234.0/255 green:173.0/255 blue:68.0/255 alpha:1.0]];
    
    
    
    [button setBackgroundImage:[UIImage imageNamed:@"jfb_btn"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"jfb_btn_pressed"] forState:UIControlStateHighlighted];
    
    //    [button setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>]
    
    
    [button.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    
}

@end
