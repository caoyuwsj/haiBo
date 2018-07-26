//
//  HPSJSysActionBackView.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJSysActionBackView.h"

@implementation HPSJSysActionBackView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    float x = rect.origin.x ;
    float y = rect.origin.y + 80;
    float w = rect.size.width;
    float h = rect.size.height;
    // 一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 画笔线的颜色
    CGContextSetRGBStrokeColor(context,1,0,0,0);
    // 线的宽度
    CGContextSetLineWidth(context, 1.0);
    // 填充颜色
    UIColor *fullColor = [UIColor whiteColor];
    CGContextSetFillColorWithColor(context, fullColor.CGColor);
    // 绘制路径
    CGContextMoveToPoint(context,x,y);
    CGContextAddLineToPoint(context,x,h);
    CGContextAddLineToPoint(context,w,h);
    CGContextAddLineToPoint(context,w,y);
    CGContextAddArcToPoint(context,w/2.0,-20,x,y,w * 0.8);
    CGContextAddLineToPoint(context,x,y);
    // 绘制路径加填充
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
