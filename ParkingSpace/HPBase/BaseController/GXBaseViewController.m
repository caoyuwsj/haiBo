//
//  GXBaseViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "GXBaseViewController.h"

@interface GXBaseViewController ()

@end

@implementation GXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backButton{
    //    return;
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickbackButton)];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}
-(void)clickbackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
}
@end
