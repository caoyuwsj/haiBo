//
//  HPMessageListViewController.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPMessageListViewController.h"

@interface HPMessageListViewController ()

@end

@implementation HPMessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.tableView .separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"消息通知";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"交易通知";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"活动通知";
    }
    cell.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



@end
