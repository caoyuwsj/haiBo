//
//  LoginEmailViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "LoginEmailViewController.h"
#import "JPullEmailTF.h"
@interface LoginEmailViewController ()
@property (weak, nonatomic) IBOutlet UIView *areaView;
@property (weak, nonatomic) IBOutlet UIButton *areaBtn;

@property (weak, nonatomic) IBOutlet JPullEmailTF *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPhone;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBtn;
@property (weak, nonatomic) IBOutlet MyButton *btnNext;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


@property (strong , nonatomic) JPullEmailTF *textField;
@end

@implementation LoginEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self disabeNextBtn];
    
   
    self.textEmail.mailCellHeight = 40;
    self.textEmail.mailListHeight = 40*4;
    self.textEmail.mailFont = [UIFont systemFontOfSize:16];
    self.textEmail.MailFontColor = [UIColor blackColor];
    self.textEmail.mailCellColor = [UIColor whiteColor];
    self.textEmail.mailBgColor =[UIColor whiteColor];
    
    

    [self.textEmail addObserver:self forKeyPath:@"text" options:0 context:nil];
    
#ifdef TEST
    self.textEmail.text = @"207615309@qq.com";
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
 
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    UIViewController* vc = [segue destinationViewController];
 
    [vc setValue:self.textPhone.hidden? _textEmail.text : [NSString stringWithFormat:@"%@ %@",self.areaBtn.titleLabel.text, _textPhone.text] forKey:@"phoneAccount"];

}


- (void)dealloc
{
    [self.textEmail removeObserver:self forKeyPath:@"text" context:nil];
    
}
- (IBAction)gotoNextView:(id)sender {
    
    [self performSegueWithIdentifier:@"gotoverifyFromEmail" sender:self];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"text"]) {
        if ([self.textEmail.text isValidateEmail]) {
            [self enableNextBtn];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (IBAction)emailEditChanged:(UITextField*)textf {
    if ([textf.text isValidateEmail]) {
        [self enableNextBtn];
    }else{
        [self disabeNextBtn];
    }
}
@end
