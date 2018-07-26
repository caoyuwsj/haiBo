//
//  GXBaseTableViewViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/18.
//  Copyright © 2018年 ArthurS·huai. All rights reserved.
//

#import "GXBaseTableViewController.h"

@interface GXBaseTableViewController ()

@end

@implementation GXBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hidesBottomBarWhenPushed = YES;
    self.tableView.bounces = NO;
    
    
    [self backButton];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
@end
