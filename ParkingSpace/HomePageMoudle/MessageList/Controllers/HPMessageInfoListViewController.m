//
//  HPMessageInfoListViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/29.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPMessageInfoListViewController.h"
#import "HPMessageInfoListTableViewCell.h"

@interface HPMessageInfoListViewController ()

@end

@implementation HPMessageInfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView .separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView reloadData];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F5F8FC"];
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 144;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPMessageInfoListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HPMessageInfoListTableViewCell"];
    if (cell == nil)
    {
        cell = [[HPMessageInfoListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"HPMessageInfoListTableViewCell"];
    }
    cell.titleLabel.text = @"发布车位";
    cell.statusLabel.text = @"未通过";
    cell.contentLabel.text = @"您于4月30日提交的车位发布信息已通过审核fhkjhfkf";
    cell.timeLabel.text = @"2018-05-01";
    return cell;
}


@end
