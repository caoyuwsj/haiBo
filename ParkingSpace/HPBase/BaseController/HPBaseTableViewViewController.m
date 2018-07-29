//
//  HPBaseTableViewViewController.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseTableViewViewController.h"

@interface HPBaseTableViewViewController ()

@end

@implementation HPBaseTableViewViewController
-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        CGFloat y = 0;
//        if (self.navigationController && !self.navigationController.navigationBar.hidden)
//        {
//            y = 64;
//        }
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y, SCREEN_WIDTH, SCREEN_HEIGHT  ) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionFooterHeight = 0.0;
        _tableView.sectionHeaderHeight = 10;
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0.0;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyboard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)showKeyboard:(NSNotification *)noti
{
    CGRect keyBoardRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height + 40, 0);
}

- (void)hideKeyboard:(NSNotification *)noti
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] init];
}


@end
