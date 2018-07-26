//
//  HPBaseTableViewViewController.h
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseViewController.h"

@interface HPBaseTableViewViewController : HPBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@end
