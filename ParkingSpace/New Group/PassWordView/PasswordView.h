//
//  PasswordView.h
//  PasswordDemo
//
//  Created by 小细菌 on 2018/7/19.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYPasswordView.h"

@interface PasswordView : UIView

@property (strong,nonatomic) finished finishedBlock;
-(void)showInView:(UIView*)view;


@end
