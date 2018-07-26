//
//  HPHomeCarNumerSelectViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
//选择停车车牌界面 用CollectionView

#import "HPHomeCarNumerSelectViewController.h"
#import "HPCarNumberSelectCollectionViewCell.h"

@interface HPHomeCarNumerSelectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic,strong)   UICollectionViewFlowLayout *flowLayout;


@end

@implementation HPHomeCarNumerSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.bottomMiddleBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.topLefttBtn.hidden = YES;
    self.topRightBtn.hidden = YES;
    self.topTitleLabel.text = @"请选择停车车牌号";
    
    
    
    /******--------collectionView的flowLayout - By Royal----------******/
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout = flowLayout;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    CGFloat itemW = 120;
    
    flowLayout.itemSize = CGSizeMake(itemW, 40);
    
    
    /******--------主体collectionView - By Royal----------******/
    UICollectionView *detailCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    detailCollectionView.scrollEnabled = YES;
    detailCollectionView.backgroundColor = [UIColor whiteColor];
    
    detailCollectionView.delegate = self;
    detailCollectionView.dataSource = self;
    self.collectionView = detailCollectionView;
    [self.cardView addSubview:detailCollectionView];
    [detailCollectionView registerClass:[HPCarNumberSelectCollectionViewCell class]
             forCellWithReuseIdentifier:@"HPCarNumberSelectCollectionViewCell"];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardView);
        make.width.equalTo(@(2* 120 + 20));
        make.top.equalTo(self.topTitleLabel.mas_bottom).offset(20);
        make.bottom.equalTo(self.bottomMiddleBtn.mas_top).offset(-10);
    }];
    
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HPCarNumberSelectCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HPCarNumberSelectCollectionViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = @"粤BZ3560";
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
