//
//  MyButton.m
//  AFDemo
//
//  Created by zheng wei on 16/5/10.
//  Copyright © 2016年 zhengw@szzcs.com. All rights reserved.
//

#import "MyButton.h"
#define kTitleRatio 0.2

@implementation MyButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
 
 
//
//
- (void)awakeFromNib {
    [self setup];
}

-(void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//文字居中显示
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self setTintColor:[UIColor blackColor]];
    
    
    [self setBackgroundImage:[UIImage imageNamed:@"黄色按钮"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"黄色按钮"] forState:UIControlStateHighlighted];
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
+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title handler:(tapHandler)handler{
    MyButton *button = [super buttonWithType:buttonType];
    button.frame = frame;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;//文字居中显示
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor colorWithRed:234.0/255 green:173.0/255 blue:68.0/255 alpha:1.0]];
    [button setBackgroundImage:[UIImage imageNamed:@"jfb_btn"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"jfb_btn_pressed"] forState:UIControlStateHighlighted];
    
    [button.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    [button addTarget:button action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.handler = handler;
    return button;
}

#pragma mark 按钮block事件
-(void)btnTapped:(UIButton *)sender{
    if(self.handler){
        self.handler(sender);
    }
}

-(void)setShortImg{
    [self setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"黄色短"] forState:UIControlStateHighlighted];

}
-(void)disable{
    self.userInteractionEnabled = NO;
    [self setBackgroundImage:[UIImage imageNamed:@"灰色渐变"] forState:UIControlStateNormal];
}
-(void)enable{
    self.userInteractionEnabled = YES;
    [self setBackgroundImage:[UIImage imageNamed:@"黄色按钮"] forState:UIControlStateNormal];
}
#pragma mark 调整内部的imageView的frame
//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    CGFloat imageX = 0;
//    CGFloat imageY = 0;
//    CGFloat imageWidth = contentRect.size.width;
//    CGFloat imageHeight = contentRect.size.height;
//    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
//}

#pragma mark 调整内部的UILabel的frame
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    CGFloat titleX = 0;
//    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
//    CGFloat titleY = contentRect.size.height - titleHeight - 3;
//    CGFloat titleWidth = contentRect.size.width;
//    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
//}
@end
