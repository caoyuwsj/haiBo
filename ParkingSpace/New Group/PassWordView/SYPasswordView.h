//
//  SYPasswordView.h
//  PasswordDemo
//
//  Created by aDu on 2017/2/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finished)( NSString* s );

@interface SYPasswordView : UIView<UITextFieldDelegate>

@property (strong,nonatomic) finished block;

/**
 *  清除密码
 */
- (void)clearUpPassword;


@end
