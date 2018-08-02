//
//  HPHomePageSearchViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/8/1.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPHomePageSearchViewController.h"
#import "HPHomeSearchBtn.h"

@interface HPHomePageSearchViewController ()
@property (nonatomic, strong) HPHomeSearchBtn * searchBar;
@end

@implementation HPHomePageSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backItem.title = @"";
//    self.navigationController.navigationBar.backItem.backBarButtonItem.image = [UIImage imageNamed:@"返回按钮"];
    self.searchBar = [[HPHomeSearchBtn alloc] initWithFrame:CGRectMake(40, 7, SCREEN_WIDTH - 40 - 40, 30)];
    self.searchBar.backgroundColor = [UIColor lightGrayColor];
    self.searchBar.searchField.userInteractionEnabled = YES;
    [self.navigationController.navigationBar addSubview:self.searchBar];
    
    
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

@end
