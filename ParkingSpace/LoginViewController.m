    //
//  LoginViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/3.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "LoginViewController.h"
#import "LMJDropdownMenu.h"

@interface LoginViewController ()<LMJDropdownMenuDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *areaView;
@property (weak, nonatomic) IBOutlet UIButton *areaBtn;
//@property (weak, nonatomic) IBOutlet LMJDropdownMenu *dropdownMenu;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPhone;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBtn;
@property (weak, nonatomic) IBOutlet MyButton *btnNext;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation LoginViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = CustomStr(@"Login");
    
    [self.areaBtn setTitle:@"+86 " forState:0];
    [self.areaBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.areaBtn.imageView.bounds.size.width, 0, self.areaBtn.imageView.bounds.size.width)];
    [self.areaBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.areaBtn.titleLabel.bounds.size.width, 0, -self.areaBtn.titleLabel.bounds.size.width)];
    
    [self.btnNext setBackgroundImage:[UIImage imageNamed:@"灰色渐变"] forState:UIControlStateNormal];
    self.btnNext.userInteractionEnabled = NO;
    
#ifdef TEST
//    self.textPhone.text = @"157 1821 2311";
//    [self enableNextBtn];
#endif
    
    

    self.navigationItem.leftBarButtonItem = nil;
    
    
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:YES];
//    //    [self.navigationController setNavigationBarHidden:NO];
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
//}
//
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    //    [self.navigationController setNavigationBarHidden:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using .
    // Pass the selected object to the new view controller.
    UIViewController* vc = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"gotoVerify"])
    {
        [vc setValue:self.textPhone.hidden? _textEmail.text : [NSString stringWithFormat:@"%@ %@",self.areaBtn.titleLabel.text, _textPhone.text] forKey:@"phoneAccount"];
    }
}

 

- (IBAction)gotoNextView:(id)sender {
    
    [self.view makeToast:@"暂未开通该功能"];
    return;
    [self performSegueWithIdentifier:@"gotoVerify" sender:self];
}


-(void)enableNextBtn
{
    self.btnNext.userInteractionEnabled = YES;
    [self.btnNext setBackgroundImage:[UIImage imageNamed:@"黄色按钮"] forState:UIControlStateNormal];
}
-(void)disabeNextBtn
{
    self.btnNext.userInteractionEnabled = NO;
    [self.btnNext setBackgroundImage:[UIImage imageNamed:@"灰色渐变"] forState:UIControlStateNormal];
}
#pragma mark - LMJDropdownMenu Delegate
//- (void)dropdownMenu:(LMJDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
//    NSLog(@"你选择了：%ld",number);
//}
//- (void)dropdownMenuWillShow:(LMJDropdownMenu *)menu{
//    NSLog(@"--将要显示--");
//}
//- (void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
//    NSLog(@"--已经显示--");
//}
//
//- (void)dropdownMenuWillHidden:(LMJDropdownMenu *)menu{
//    NSLog(@"--将要隐藏--");
//}
//- (void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
//    NSLog(@"--已经隐藏--");
//}
#pragma marks textfiled deleget
#define WRONG_FARMAT @"您输入的手机号码不正确,请重新输入"
- (IBAction)phoneEditChanged:(UITextField*)textf {
    if (textf.text.Trim.length == 11) {
        if ([textf.text.Trim isMobilePhoneNumber]) {
            [self enableNextBtn];
            return;
        }else{
            TOAST(WRONG_FARMAT);
        }
    }else if(textf.text.Trim.length < 11){
        
    }else if(textf.text.Trim.length > 11){
        TOAST(WRONG_FARMAT);
    }
    if (textf.text.length == 3) {
        textf.text = [NSString stringWithFormat:@"%@ ",textf.text];
    }
    if (textf.text.Trim.length == 7) {
        textf.text = [NSString stringWithFormat:@"%@ ",textf.text];
    }
    [self disabeNextBtn];
}

- (IBAction)emailEditChanged:(UITextField*)textf {
    if ([textf.text isValidateEmail]) {
        [self enableNextBtn];
    }else{
        [self disabeNextBtn];
    }
}

@end
