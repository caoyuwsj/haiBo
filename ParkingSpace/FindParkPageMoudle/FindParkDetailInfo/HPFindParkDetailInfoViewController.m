//
//  HPFindParkDetailInfoViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/31.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPFindParkDetailInfoViewController.h"
#import "TYCyclePagerView.h"

@interface HPFindParkDetailInfoViewController ()<TYCyclePagerViewDataSource,
TYCyclePagerViewDelegate>
/******------pageFlowView------******/
@property(nonatomic,weak)TYCyclePagerView *pageFlowView;
@property (nonatomic, strong) UILabel * countLabel;

@end

@implementation HPFindParkDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    TYCyclePagerView *pageFlowView = [[TYCyclePagerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - kTabBarHeight - 190, SCREEN_WIDTH, 180)];
    self.pageFlowView = pageFlowView;
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.isInfiniteLoop = NO;
    pageFlowView.autoScrollInterval = 0;
    [pageFlowView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"TYCyclePagerViewCell"];
    self.tableView.tableHeaderView = self.pageFlowView;
    self.tableView.frame = CGRectMake(0, -44, SCREEN_WIDTH, SCREEN_HEIGHT +44);
   
    self.navigationController.navigationBar.hidden = YES;
    [self.pageFlowView reloadData];
    [self.pageFlowView removeTimer];
    
    self.countLabel = [UILabel new];
    self.countLabel.backgroundColor = [UIColor whiteColor];
    self.countLabel.layer.cornerRadius = 15.0;
    self.countLabel.clipsToBounds = YES;
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.font = kFontSize(17);
    self.countLabel.text = @"1/4";
    self.countLabel.textColor = kTextColor_3;
    [self.pageFlowView addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pageFlowView).offset(-8);
        make.right.equalTo(self.pageFlowView).offset(-16);
        make.height.equalTo(@(30));
        make.width.greaterThanOrEqualTo(@(40));
    }];
}

#pragma mark - 滚动视图第三方代理
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return 4;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"TYCyclePagerViewCell" forIndex:index];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:@""] placeholder:[UIImage imageWithColor:[UIColor lightGrayColor]]];

    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView
{
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    
    
    {
        layout.layoutType = TYCyclePagerTransformLayoutNormal;
        layout.isInfiniteLoop = NO;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, 180);
        layout.itemSpacing = 0;
        layout.itemHorizontalCenter = YES;
    }
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    [self.pageFlowView removeTimer];
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index
{
    
}

#pragma mark - 必须实现,不然会崩溃,第三方没处理好 -By Royal
-(void)pagerViewDidScroll:(TYCyclePagerView *)pageView
{
    [self.pageFlowView removeTimer];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
        return 2;
    }
    else if (section == 3)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}





@end
