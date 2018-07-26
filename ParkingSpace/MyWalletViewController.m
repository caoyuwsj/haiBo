//
//  MyWalletViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/7.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "MyWalletViewController.h"

@interface MyWalletViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray* titleArray;
@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topView.backgroundColor = DEFAULT_COLOR;
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray*)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"充值",@"提现",@"绑定银行卡"];
    }
    return _titleArray;
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
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    NSString * identifier= @"chooseCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    cell.backgroundColor = [UIColor grayColor];
    //自适应图片（大小）
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString* identify = [NSString new];
    switch (indexPath.row) {
        case 0:
            identify = @"walletgotoCharge";
            break;
            
        default:
            break;
    }
    
    [self performSegueWithIdentifier:identify sender:self];
}

@end
