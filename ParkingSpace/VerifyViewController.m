//
//  VerifyViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/3.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "VerifyViewController.h"

@interface VerifyViewController ()
@property (weak, nonatomic) IBOutlet MyButton *verifyBtn;
@property (weak, nonatomic) IBOutlet UIImageView *testImg;
@property (weak, nonatomic) IBOutlet MJCountDownButton *btnCode;
@property (weak, nonatomic) IBOutlet UILabel *agreeLabel;
@property (weak, nonatomic) IBOutlet UIButton *imgCode;
@property (weak, nonatomic) IBOutlet UITextField *textPhoneCode;
@property (weak, nonatomic) IBOutlet UITextField *textShow;
@property (weak, nonatomic) IBOutlet MyButton *nextBtn;
@property (weak, nonatomic) IBOutlet UITextField *photoCode;
@end

@implementation VerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textShow.text = self.phoneAccount;
 
    //    [self.btnCode countDownFromTime:60 unitTitle:@"s" completion:^(MJCountDownButton *countDownButton) {
//        [countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//    }];
 
    
    NSString* info = @"注册即表示您已阅读,并同意《用户注册协议》";
    NSInteger len = @"《用户注册协议》".length;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:info];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value: DEFAULT_COLOR
                    range:NSMakeRange(info.length - len, len)];
    self.agreeLabel.attributedText = attrStr;
    [_agreeLabel sizeToFit];
    
    [self.agreeLabel bk_whenTapped:^{
        [self performSegueWithIdentifier:@"gotoInfo" sender:self];
    }];
    
    
    [self.nextBtn disable];
    
    [self getImgCode];
    self.testImg.layer.masksToBounds = YES;
    [self.testImg bk_whenTapped:^{
        [self getImgCode];
    }];
}
-(void)getImgCode{
    NSMutableDictionary * optionDic = [NSMutableDictionary dictionary];
//    [optionDic setObject:@"wondshj" forKey:@"option"];
    //必填项
    NSMutableDictionary * mustdic = [NSMutableDictionary dictionary];
    if([self.textShow.text hasPrefix:@"+"]){
        [mustdic setObject:[self.textShow.text.Trim substringFromIndex:3] forKey:@"username"];
    }else{
        [mustdic setObject:self.textShow.text.Trim  forKey:@"username"];
    }
    
    NSString * url = API_GetImgCode;//@"carmaster/getimgcode";
    
    //发起请求 token 的生成目前没有加userkey;本地保存之后会加上
    
    [GXNetWorking getJSONWithUrl:url mustParameters:mustdic optionParameters:optionDic success:^(id result) {
        
        self.testImg.image = [UIImage imageWithData:result];
    } fail:^(NSError *error) {
        
    } viewController:self ForMethod:NetworkRequestMethodTypeGetData nodataViewAddInSuperView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
*/
- (IBAction)editChanged:(id)sender {
    if (self.photoCode.text.length == 4 && self.textPhoneCode.text.length==4) {
        [self.nextBtn enable];
    }else{
        [self.nextBtn disable];
    }
}

- (IBAction)requestVeryfiCode:(MJCountDownButton*)btn {
    
    if (self.photoCode.text.length < 1) {
        TOAST(@"请先输入图片验证码");
        return;
    }
    
    if (self.photoCode.text.length != 4) {
        TOAST(@"图片验证码输入有误");
        return;
    }
    NSString* areacode = [self.textShow.text hasPrefix:@"+"] ? [self.textShow.text substringToIndex:3] : @"" ;
    
    //选填项
    NSMutableDictionary * optionDic = [NSMutableDictionary dictionary];
//    [optionDic setObject:@"wondshj" forKey:@"option"];
    //必填项
    NSMutableDictionary * mustdic = [NSMutableDictionary dictionary];
    [mustdic setObject:areacode forKey:@"areacode"];
    [mustdic setObject:self.photoCode.text forKey:@"code"];
    if([self.textShow.text hasPrefix:@"+"]){
        [mustdic setObject:[self.textShow.text.Trim substringFromIndex:3] forKey:@"username"];
    }else{
        [mustdic setObject:self.textShow.text.Trim  forKey:@"username"];
    }
    NSString * url = API_SendCode;
    
    //发起请求 token 的生成目前没有加userkey;本地保存之后会加上
 
    
    [GXNetWorking gxPostJSONWithUrl:url mustParameters:mustdic optionParameters:optionDic success:^(BOOL succeed , NSString* msg , NSString*code , id obj) {
        
        if (succeed) {
            [btn countDownFromTime:60 unitTitle:@"s" completion:^(MJCountDownButton *countDownButton) {
                [countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
            }];
            TOAST(@"获取验证码成功");
        }else{
            TOAST(msg);
        }

    } fail:^(NSError *error) {

    } viewController:self ForMethod:NetworkRequestMethodTypeGetData nodataViewAddInSuperView:self.view];   
}



- (IBAction)gotoRealName:(id)sender {
    
 
    
    NSString* usrName  =  [NSString new];
    if ([self.textShow.text hasPrefix:@"+"]) {
        usrName = [self.textShow.text.Trim substringFromIndex:3];
    }else{
        usrName = self.textShow.text.Trim;
    }
    
    NSDictionary* dic = @{
                          @"areacode" : [self.textShow.text hasPrefix:@"+"] ? [self.textShow.text substringToIndex:3] : @"",
                          @"username" : usrName,
                          @"code" : self.textPhoneCode.text
                          };
    
    [GXNetWorking gxPostJSONWithUrl:API_Login mustParameters:dic optionParameters:nil success:^(BOOL succeed , NSString* msg , NSString*code , id obj) {
        
        if (succeed) {
            TOAST(@"登录成功");
            USER.sid = obj[@"sid"];
            USER.userkey = obj[@"userkey"];
            [[NSUserDefaults standardUserDefaults] setObject:obj[@"userkey"] forKey:kUserKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self performSelector:@selector(gotoNextVc) withObject:nil afterDelay:2];
        }else{
            TOAST(msg);
        }
        
    } fail:^(NSError *error) {
        
    } viewController:self ForMethod:NetworkRequestMethodTypeGetData nodataViewAddInSuperView:self.view];
}
-(void)gotoNextVc{
    [self performSegueWithIdentifier:@"gotoRealName" sender:self];
}
@end
