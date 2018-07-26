//
//  HPParkCostDetailViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPParkCostDetailViewController.h"
#import "HPParkUserIngViewController.h"

@interface HPParkCostDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView * line;
@property (nonatomic, strong) UIView * circleView1;
@property (nonatomic, strong) UIView * circleView2;
@property (nonatomic, strong) UIImageView * sucessImageView;;
@property (nonatomic, strong) UILabel * sucessLabel;
@property (nonatomic, strong) UILabel * addressLabel;

@property (nonatomic, strong) UITableView * tableView;


@end

@implementation HPParkCostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.bottomMiddleBtn.hidden = YES;
    [self sj_initTopSubVews];
    
    
    [self.topLefttBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.topRightBtn setTitle:@"我知道了" forState:UIControlStateNormal];
    
    [self.topLefttBtn setImage:nil forState:UIControlStateNormal];
    [self.topRightBtn setImage:nil forState:UIControlStateNormal];
    
    [self.topLefttBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self.topRightBtn setBackgroundImage:nil forState:UIControlStateNormal];
    
    self.topLefttBtn.backgroundColor = [UIColor colorWithHexString:@"#B5B5B5"];
    self.topRightBtn.backgroundColor = [UIColor colorWithHexString:@"#FAC02D"];
    self.topLefttBtn.layer.cornerRadius = 22.5;
    self.topRightBtn.layer.cornerRadius = 22.5;
    self.topLefttBtn.clipsToBounds = YES;
    self.topRightBtn.clipsToBounds = YES;
    //13246677811
    
    
}
/**
 上半部分初始化
 */
-(void)sj_initTopSubVews
{
    self.line = [UIImageView new];
    self.line.image = [UIImage imageNamed:@"Line"];
    [self.cardView addSubview:self.line];
    
    self.circleView1 = [UIView new];
    self.circleView1.layer.cornerRadius = 15.0;
    self.circleView1.clipsToBounds = YES;
    self.circleView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.circleView1];
    
    self.circleView2 = [UIView new];
    self.circleView2.layer.cornerRadius = 15.0;
    self.circleView2.clipsToBounds = YES;
    self.circleView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.circleView2];
    
    self.sucessImageView = [UIImageView new];
    self.sucessImageView.image = [UIImage imageNamed:@"logo"];
    [self.cardView addSubview:self.sucessImageView];
    
    self.sucessLabel = [UILabel new];
    self.sucessLabel.font = kFontSize(15);
    self.sucessLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.sucessLabel.textAlignment = NSTextAlignmentCenter;
    self.sucessLabel.text = @"扫码车位成功";
    [self.cardView addSubview:self.sucessLabel];
    
    self.addressLabel = [UILabel new];
    self.addressLabel.font = kFontSize(14);
    self.addressLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.addressLabel.textAlignment = NSTextAlignmentCenter;
    self.addressLabel.text = @"海岸城东座停车场-1层A区9号停车位";
    [self.cardView addSubview:self.addressLabel];


    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 ) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionFooterHeight = 0.0;
    _tableView.sectionHeaderHeight = 10;
    _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.estimatedRowHeight = 0.0;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.estimatedSectionHeaderHeight = 0.0;
    _tableView.estimatedSectionFooterHeight = 0.0;

    [self.cardView addSubview:_tableView];


    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardView).offset(164);
        make.left.equalTo(self.cardView);
        make.right.equalTo(self.cardView);
    }];
    
    [self.circleView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView.mas_left);
        make.centerY.equalTo(self.line);
        make.height.width.equalTo(@(30));
    }];
    
    [self.circleView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView.mas_right);
        make.centerY.equalTo(self.line);
        make.height.width.equalTo(@(30));
    }];
    
    [self.sucessImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView);
        make.top.equalTo(self.cardView).offset(24);
        make.height.width.equalTo(@(40));
    }];
    
    [self.sucessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView);
        make.top.equalTo(self.sucessImageView.mas_bottom).offset(8);
        make.height.equalTo(@(25));
    }];

    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView);
        make.top.equalTo(self.sucessLabel.mas_bottom).offset(8);
        make.height.equalTo(@(25));
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_bottom).offset(5);
        make.left.equalTo(self.cardView).offset(16);
        make.right.equalTo(self.cardView).offset(-16);
        make.bottom.equalTo(self.cardView).offset(-45 - 30 - 20);
    }];
    
    
    UITableViewHeaderFooterView * header = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    header.textLabel.textAlignment = NSTextAlignmentCenter;
    header.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    header.textLabel.font  = kFontSize(17);
    header.textLabel.numberOfLines = 2;
    header.textLabel.text = @"金融中心海上世界停车场收费标准";
    self.tableView.tableHeaderView = header;
    
    UITableViewHeaderFooterView * footer = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    footer.textLabel.textAlignment = NSTextAlignmentLeft;
    footer.textLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    footer.textLabel.font  = kFontSize(13);
    footer.textLabel.text = @"说明：我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明";
    footer.textLabel.numberOfLines = 0;
    self.tableView.tableFooterView = footer;
    
}

-(void)addCardViewContains
{
    if (self.cardView)
    {
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(80);
            make.bottom.equalTo(self.view).offset(-80);
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
        }];
    }
}

/**
 左上角约束
 */
-(void)addTopLeftBtnContains
{
    if (self.topLefttBtn && self.cardView)
    {
        [self.topLefttBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cardView).offset(16);
            make.bottom.equalTo(self.cardView).offset(-16);
            make.height.equalTo(@(45));
            make.width.equalTo(@(130));
        }];
    }
}
/**
 右上角约束
 */
-(void)addTopRightBtnContains
{
    if (self.topRightBtn  && self.cardView)
    {
        [self.topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cardView).offset(-16);
            make.bottom.equalTo(self.cardView).offset(-16);
            make.height.equalTo(@(45));
            make.width.equalTo(@(130));
        }];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    if (header == nil)
    {
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
        header.textLabel.font = kFontSize(15);
        header.textLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    if (section == 0)
    {
        header.textLabel.text = @"小车 (每天封顶35元)";
    }
    else if (section == 1)
    {
        header.textLabel.text = @"大车 (每天封顶70元)";
    }
    else if (section == 2)
    {
        header.textLabel.text = @"超大车 (每天封顶105元)";
    }
    return header;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.font = kFontSize(15);
    cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    cell.textLabel.text = @"白天（07:00~21:00）";
    cell.detailTextLabel.text = @"5元/半小时";
    cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    cell.detailTextLabel.font = kFontSize(15);
    return cell;
}

-(void)topRightBtnActon:(UIButton *)sender
{
    
    [self dismissViewControllerAnimated:NO completion:^{
//        HPParkUserIngViewController * bindcarVc = [HPParkUserIngViewController new];
//        bindcarVc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
//        //关键语句，必须有
//        bindcarVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
//        [kAppDelegate.maintabBar presentViewController:bindcarVc animated:NO completion:^{
//            bindcarVc.view.superview.backgroundColor = [UIColor clearColor];
//        }];
    }];
    
    
}

-(void)topLefttBtnActon:(UIButton *)sender
{
    [self dismissViewControllerAnimated:NO completion:^{
        //        HPParkUserIngViewController * bindcarVc = [HPParkUserIngViewController new];
        //        bindcarVc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
        //        //关键语句，必须有
        //        bindcarVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
        //        [kAppDelegate.maintabBar presentViewController:bindcarVc animated:NO completion:^{
        //            bindcarVc.view.superview.backgroundColor = [UIColor clearColor];
        //        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
