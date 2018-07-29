//
//  HPMessageListViewController.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPMessageListViewController.h"
#import "HPSJMessageListTableViewCell.h"
#import "HPMessageInfoListViewController.h"

@interface HPMessageListViewController ()

@end

@implementation HPMessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.tableView .separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView reloadData];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F5F8FC"];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSJMessageListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HPSJMessageListTableViewCell"];
    if (cell == nil)
    {
        cell = [[HPSJMessageListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"HPSJMessageListTableViewCell"];
    }
    if(indexPath.row == 0)
    {
        cell.titleLabel.text = @"消息通知";
    }
    else if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"交易通知";
    }
    else if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"活动通知";
    }
    cell.countLabel.text = @"3";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPMessageInfoListViewController * infoVc = [HPMessageInfoListViewController new];
    infoVc.title = @"交易通知";
    [self.navigationController pushViewController:infoVc animated:YES];
}


@end
