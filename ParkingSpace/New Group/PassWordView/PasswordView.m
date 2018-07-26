//
//  PasswordView.m
//  PasswordDemo
//
//  Created by 小细菌 on 2018/7/19.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import "IQKeyboardManager.h"
/**
 屏幕宽度
 */
#define SCREEN_WIDTH_ [UIScreen mainScreen].bounds.size.width

/**
 屏幕高度
 */
#define SCREEN_HEIGHT_ [UIScreen mainScreen].bounds.size.height


#import "PasswordView.h"

@interface PasswordView()
@property (strong,nonatomic) UIImageView* deleteImgV;
@property (strong,nonatomic) SYPasswordView * pasView;
@property (strong , nonatomic) UIView* bgView;
@end
@implementation PasswordView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView{
    
    [IQKeyboardManager sharedManager].enable = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyboard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    

    
    CGFloat imgvWidh = 20.f;
    self.deleteImgV =  [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, imgvWidh, imgvWidh)];
    _deleteImgV.image = [UIImage imageNamed:@"叉叉"];
    _deleteImgV.userInteractionEnabled = YES;
    [self addSubview:_deleteImgV];
    [self.deleteImgV bk_whenTapped:^{
        
        [self removeFromSuperview];
        
        
    
    }];
    
    
    
    CGFloat labelHeight = imgvWidh+imgvWidh*2;
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_, labelHeight)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请输入支付密码";
    label.font = [UIFont systemFontOfSize:23];
    [self addSubview:label];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, labelHeight, SCREEN_WIDTH_, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    
    
    self.pasView = [[SYPasswordView alloc] initWithFrame:CGRectMake(20 , labelHeight+20, SCREEN_WIDTH_ - 40, (SCREEN_WIDTH_-40)/6)];
    WeakSelf;
    self.pasView.block = ^(NSString* s){
        [weakSelf removeFromSuperview];
        weakSelf.finishedBlock(s);
    };
    [self addSubview:self.pasView];
    
}

- (void)showKeyboard:(NSNotification *)noti
{
    CGRect keyBoardRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat keBoardH = keyBoardRect.size.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.frame = CGRectMake(0, self.frame.origin.y - keBoardH, SCREEN_WIDTH, self.bounds.size.height);
    }];
}

- (void)hideKeyboard:(NSNotification *)noti
{
    
    [UIView animateWithDuration:0.25 animations:^{
        [self removeFromSuperview];
//        self.frame = CGRectMake(0, self.frame.origin.y , SCREEN_WIDTH, self.bounds.size.height + 50);
    }];
}
-(void)removeFromSuperview{
    [super removeFromSuperview];
    [self.bgView removeFromSuperview];
    [IQKeyboardManager sharedManager].enable = YES;
}

-(void)showInView:(UIView*)view{
    
    self.bgView = [[UIView alloc] initWithFrame:view.frame];
    self.bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [view addSubview:self.bgView];
    [view addSubview:self];
}
@end
