//
//  HPCarParkCostInfoViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/21.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPCarParkCostInfoViewController.h"

@interface HPCarParkCostInfoViewController ()

@property (nonatomic, strong) NSArray  * secTwoTitle;

@end

@implementation HPCarParkCostInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"停车详情";
    
    [self setNavBarBackItemWithImageName:@"返回按钮"];
    
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 5;
    }
    else if (section == 3)
    {
        return 5;
    }
    else if (section == 4)
    {
        return 3;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 4)
    {
        return 60;
    }
    return CGFLOAT_MIN;
  
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView * footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    if (footer == nil)
    {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
        footer.contentView.backgroundColor = [UIColor colorWithHexString:@"#F5F8FC"];
    }
    return footer;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 4)
    {
        UITableViewHeaderFooterView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
        if (header == nil)
        {
            header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
            header.backgroundColor = [UIColor whiteColor];
            header.textLabel.font = kFontSize(18);
            header.textLabel.textAlignment = NSTextAlignmentCenter;
            header.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
            header.textLabel.text = @"消费明细";
            
        }
        return header;
    }
    else
    {
        return nil;
    }
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        cell.textLabel.font = kFontSize(16);

    }
    cell.textLabel.font = kFontSize(16);
    cell.imageView.image = nil;
    cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        cell.imageView.image = [UIImage imageNamed:@"Logo"];
        cell.textLabel.text = @"嗨泊停车";
                cell.textLabel.font = kFontSize(20);
        return cell;
    }
    
    else if (indexPath.section == 1 && indexPath.row == 0)
    {
        cell.textLabel.text = @"付款金额";
        cell.detailTextLabel.text = @"￥5.0";
    }
    else if (indexPath.section == 2 )
    {
        switch (indexPath.row)
        {
            case 0:
            {
                cell.textLabel.text = @"当前状态";
                cell.detailTextLabel.text = @"已完成";
            }
                break;
            case 1:
            {
                cell.textLabel.text = @"车牌号码";
                cell.detailTextLabel.text = @"粤B Z56V9";
            }
                break;
            case 2:
            {
                cell.textLabel.text = @"泊位编号";
                cell.detailTextLabel.text = @"A-234682";
            }
                break;
            case 3:
            {
                cell.textLabel.text = @"预计停留时间";
                cell.detailTextLabel.text = @"30分钟";
            }
                break;
            case 4:
            {
                cell.textLabel.text = @"停车场";
                cell.detailTextLabel.text = @"富强路-泰然产业园";
            }
                break;
                
            default:
                break;
        }
    }
    else if (indexPath.section == 3 )
    {
        switch (indexPath.row)
        {
            case 0:
            {
                cell.textLabel.text = @"订单编号";
                cell.detailTextLabel.text = @"HB201805315120";
            }
                break;
            case 1:
            {
                cell.textLabel.text = @"开始时间";
                cell.detailTextLabel.text = @"2018-05-28 15:24:26";
            }
                break;
            case 2:
            {
                cell.textLabel.text = @"结束时间";
                cell.detailTextLabel.text = @"2018-05-28 15:24:26";
            }
                break;
            case 3:
            {
                cell.textLabel.text = @"计费时长";
                cell.detailTextLabel.text = @"30分钟";
            }
                break;
            case 4:
            {
                cell.textLabel.text = @"计费说明：停车时长不足半小时按半小时计算";
                cell.detailTextLabel.text = nil;
                cell.textLabel.font = kFontSize(12);
                cell.textLabel.textColor = [UIColor redColor];
            }
                break;
                
            default:
                break;
        }
    }
    else if (indexPath.section == 4)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"停车券抵扣";
            cell.detailTextLabel.text = @"-4元";
        }
        if (indexPath.row == 1)
        {
            cell.textLabel.text = @"余额自动扣费";
            cell.detailTextLabel.text = @"-4元";
        }
        if (indexPath.row == 2)
        {
            cell.textLabel.text = @"支付订单号";
            cell.detailTextLabel.text = nil;
        }
    
        
    }
    
    
    return cell;
}


@end
