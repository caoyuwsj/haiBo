//
//  ChangePhoneViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
#import "HPBaseAltActionViewController.h"
#import "ChangePhoneViewController.h"
#import "GxChangePhoneViewController.h"
@interface ChangePhoneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *textMain;
@property (weak, nonatomic) IBOutlet YYLabel *textInfo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoHeight;
@property (weak, nonatomic) IBOutlet MyButtonSmall *btn;

@end

@implementation ChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textInfo.text = @"";
    

    
    if (self.type.integerValue == 0) {
        self.textMain.text = [USER.person.phone isBlankString] ? @"您还未绑定手机,请立即绑定" : USER.person.phone;
        if(USER.person.phone.length<1)
        {
            self.title  = @"绑定手机";
            self.imgV.image = [UIImage imageNamed:@"未绑定手机"];
            [self.btn setTitle:@"绑定手机" forState:0];
            self.infoHeight.constant = 10;
        }else{
            self.title  = @"修改手机";
            [self.btn setTitle:@"知道了,我要更换" forState:0];
            self.textInfo.text = @"1.xxxxxxxxxx\n2xxxxxxxxxxxxxxx\n3jdhfshdjhfi3u2hkjhfkfs";
           
            NSDictionary *attrs = @{NSFontAttributeName : self.textInfo.font};
            
            CGFloat labelWidth = [UIScreen mainScreen].bounds.size.width -40;
            CGSize maxSize = CGSizeMake(labelWidth, MAXFLOAT);
            
            // 计算文字占据的高度
            CGSize size = [self.textInfo.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;

            self.infoHeight.constant = size.height+20;
            
        }
    }
    
    if(self.type.integerValue == 1){
        
        self.imgV.image = [UIImage imageNamed:@"邮箱"];
         self.textMain.text = [USER.person.email isBlankString] ? @"您还未绑定邮箱,请立即绑定" : USER.person.email;
        
        if(USER.person.email.length<1)
        {
            self.title  = @"绑定邮箱";
            self.imgV.image = [UIImage imageNamed:@"邮箱"];
            [self.btn setTitle:@"绑定邮箱" forState:0];
            self.infoHeight.constant = 10;
        }else{
           self.title  = @"修改邮箱";
            [self.btn setTitle:@"知道了,我要更换" forState:0];
            self.textInfo.text = @"1.xxxxxxxxxx\n2xxxxxxxxxxxxxxx\n3jdhfshdjhfi3u2hkjhfkfs";
            
            NSDictionary *attrs = @{NSFontAttributeName : self.textInfo.font};
            
            CGFloat labelWidth = [UIScreen mainScreen].bounds.size.width -40;
            CGSize maxSize = CGSizeMake(labelWidth, MAXFLOAT);
            
            // 计算文字占据的高度
            CGSize size = [self.textInfo.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
            
            self.infoHeight.constant = size.height+20;
            
        }
    }
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController* v = [segue destinationViewController];
    [v setValue:[NSString stringWithString:self.title] forKey:@"testS"];
    v.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    v.modalPresentationStyle = UIModalPresentationOverFullScreen;
//    [v setValue:self.title forKey:@"tipTitle"];
    
//    [self presentViewController:v animated:NO completion:^{
//        v.view.superview.backgroundColor = [UIColor clearColor];
//    }];
}

- (IBAction)btnClick:(id)sender {

    [self performSegueWithIdentifier:@"GxChangePhoneViewController" sender:self];
    return;
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Setting" bundle:nil];
    GxChangePhoneViewController* v = [sb instantiateViewControllerWithIdentifier:@"GxChangePhoneViewController"];
    v.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    v.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [v setValue:self.title forKey:@"tipTitle"];
    [self presentViewController:v animated:NO completion:^{
        v.view.superview.backgroundColor = [UIColor clearColor];
    }];
 
}

@end
