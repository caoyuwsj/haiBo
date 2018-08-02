//
//  HPHomePageInputParkNumberViewController.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageInputParkNumberViewController.h"
#import "HPHomePageInputParkNumberActionView.h"
#import "HPParkCostDetailViewController.h"

#define actionViewHeight 190

@interface HPHomePageInputParkNumberViewController ()<HPHomePageInputParkNumberActionViewDelegate>

@property (nonatomic, strong) HPHomePageInputParkNumberActionView * inPutActionView;
@property (nonatomic, assign) CGFloat actionViewOrgY;

@end

@implementation HPHomePageInputParkNumberViewController

-(HPHomePageInputParkNumberActionView *)inPutActionView
{
    if (_inPutActionView == nil)
    {
        _inPutActionView = [[HPHomePageInputParkNumberActionView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - actionViewHeight - 50, SCREEN_WIDTH, actionViewHeight + 50)];
        self.actionViewOrgY = SCREEN_HEIGHT - actionViewHeight - 50;
        _inPutActionView.inputTexField.keyboardType = UIKeyboardTypeNumberPad;
        _inPutActionView.delegate = self;
    }
    return _inPutActionView;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.inPutActionView.inputTexField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.inPutActionView];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyboard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];



    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH - 45, 27, 30, 30);
    [btn setImage:[UIImage imageNamed:@"黑叉叉"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)btnBack
{
    [self.view endEditing:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [self.navigationController popViewControllerAnimated:NO];
        if (!vc) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    });

}

- (void)showKeyboard:(NSNotification *)noti
{
    CGRect keyBoardRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    CGFloat keBoardH = keyBoardRect.size.height;

    [UIView animateWithDuration:0.25 animations:^{

        self.inPutActionView.frame = CGRectMake(0, self.actionViewOrgY - keBoardH, SCREEN_WIDTH, actionViewHeight + 50);
    }];
}

- (void)hideKeyboard:(NSNotification *)noti
{

    [UIView animateWithDuration:0.25 animations:^{
        
        self.inPutActionView.frame = CGRectMake(0, self.actionViewOrgY , SCREEN_WIDTH, actionViewHeight + 50);
    }];
}


//开始停车
- (void)HPHomePageInputParkNumberActionView:(HPHomePageInputParkNumberActionView *)view nextBtnClick:(UIButton *)sender
{
    [self presetnSucessDetailVc];
}
-(void)presetnSucessDetailVc
{
    [self dismissViewControllerAnimated:NO completion:^{
        HPParkCostDetailViewController * bindcarVc = [HPParkCostDetailViewController new];
        bindcarVc.view.backgroundColor=[UIColor lightGrayColor];
        //关键语句，必须有
        bindcarVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [kAppDelegate.maintabBar presentViewController:bindcarVc animated:NO completion:^{
            bindcarVc.view.superview.backgroundColor = [UIColor clearColor];
            
        }];
    }];
    
}

@end
