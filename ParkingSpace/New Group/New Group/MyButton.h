//
//  MyButton.h
//  AFDemo
//
//  Created by zheng wei on 16/5/10.
//  Copyright © 2016年 zhengw@szzcs.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapHandler)(UIButton *sender);
@interface MyButton : UIButton
@property (strong,nonatomic)tapHandler handler;

+(id)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title handler:(tapHandler)handler;
+(void)setBtnStyle:(UIButton*)btn;
-(void)setShortImg;
-(void)disable;
-(void)enable;
@end
