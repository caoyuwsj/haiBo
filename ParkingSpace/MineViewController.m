//
//  MineViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/7.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
#import "JXLayoutButton.h"
#import "MineViewController.h"
#import "ContactViewController.h"
#import "PersonalInfo.h"
@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imgHead;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@property (strong , nonatomic) NSArray *titleArray;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = DEFAULT_COLOR;
//    self.topView.backgroundColor = [UIColor clearColor];
#ifdef TEST
    USER.sid = @"09c30c1dcbc814e95b1a674407535fd3940acf6075343e141e03724bc5c2c345";
    USER.userkey = @"1c21f7d9429649f52ddbc021861cd4997e49f6b3";
#endif
    
   //设置头像
    self.imgHead.layer.cornerRadius = self.imgHead.bounds.size.height/2;
    self.imgHead.layer.masksToBounds = YES;
    [self.imgHead bk_whenTapped:^{
        [self performSegueWithIdentifier:@"gotoPersonal" sender:self];
    }];
    
    
    //设置登录按钮
    
//    NSDictionary* dic = @{@"sid" : USER.sid};
//    [GXNetWorking gxPostWithUrl:API_GetPersonalInfo mustParameters:dic success:^(BOOL succeed , NSString*msg , NSString* code ,id obj){
//        //[User sharedInstance]
//        if (succeed) {
//            USER.person = [PersonalInfo mj_objectWithKeyValues:obj];
//            self.userName.text = USER.person.nickname;
//            [self.imgHead setImageURL:[NSURL URLWithString:USER.person.avatar]];
//            if (USER.person.iscertification.integerValue == 0) {
//                [self setUnVerifyStyle];
//            }else{
//
//            }
//
//        }else{
//            TOAST(msg);
//        }
//    } viewController:self];
}

-(NSArray*)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"我的钱包",@"我的奖励",@"我的押金",@"我的收入",@"邀请好友",@"停车券",@"客服",@"客量管理"];
    }
    return _titleArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUnVerifyStyle{
    self.loginBtn.layer.cornerRadius = self.loginBtn.bounds.size.height/2;
    self.loginBtn.layer.masksToBounds = YES;
    [self.loginBtn setTitle:@" 车主未认证 " forState:0];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [self.loginBtn setBackgroundColor:[UIColor lightGrayColor]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
//    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    if(USER.imgHead != nil)
        self.imgHead.image = USER.imgHead;
    
//    if (USER.person.iscertification.integerValue == 0) {
//        [self setUnVerifyStyle];
//    }
    [self.login setTitle:CustomStr(@"登录注册") forState:0];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    return;
    [self initView];
}
-(void)initView
{
    
    CGFloat width = SCREEN_WIDTH/3;
    for(int j = 0 ; j <2 ; j++){
        for (int i = 0  ; i<3; i++) {
            JXLayoutButton *btn = [[JXLayoutButton alloc] init];
            btn.frame = CGRectMake(i*width, j*width, width, width-5);
            [btn setTitle:self.titleArray[i+j*4] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            NSString* imgStr = [NSString stringWithFormat:@"img%d",i+j*3];
            [btn setImage:[UIImage imageNamed:imgStr] forState:0];
            [self.contentView addSubview:btn];
            btn.tag = j*3+i;
            [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//            [btn bk_whenTapped:^{
//                [weakSelf loadMerchInfo:btn.titleLabel.text];
//            }];
        }
    }
    
}


-(void)contactUs{
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    UIViewController* v = [sb instantiateViewControllerWithIdentifier:@"ContactViewController"];
    v.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    v.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:v animated:NO completion:^{
        v.view.superview.backgroundColor = [UIColor clearColor];
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController* vc = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"gotoPersonal"]){
        [vc setValue:self.imgHead.image forKey:@"imgHead"];
    }
}

//gotoWallet
-(void)click:(UIButton*)btn{
    switch (btn.tag) {
        case 0:
//            [self performSegueWithIdentifier:@"gotoWallet" sender:self];
            break;
            
        case 5:
            [self contactUs];
            break;
            
        default:
            break;
    }
}

@end
