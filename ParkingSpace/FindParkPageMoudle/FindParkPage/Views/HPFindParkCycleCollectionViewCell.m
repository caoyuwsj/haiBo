//
//  HPFindParkCycleCollectionViewCell.m
//  ParkingSpace
//
//  Created by mac on 2018/7/30.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPFindParkCycleCollectionViewCell.h"


@implementation HPFindParkCycleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews
{
    HPBaseCardView * card = [[HPBaseCardView alloc] initWithFrame:CGRectZero];
    self.cardView = card;
    self.cardView.cardBackView.layer.cornerRadius = 8.0;
    self.cardView.shadowLayer.cornerRadius = 8.0;
    [self addSubview:self.cardView];
    
    UILabel * title = [UILabel new];
    self.titleLabel = title;
    self.titleLabel.font = kFontSize(18);
    self.titleLabel.text = @"恒丰财富港大厦停车场";
    self.titleLabel.textColor = kTextColor_3;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.cardView addSubview:self.titleLabel];
    
    UIImageView * acc = [UIImageView new];
    self.accImage = acc;
    self.accImage.image = [UIImage imageNamed:@"更多"];
    [self.cardView addSubview:self.accImage];
    
    HPFindParkCycleCellMoudleView * price = [HPFindParkCycleCellMoudleView new];
    self.priceMoudle = price;
    self.priceMoudle.titleLabel.text = @"价格";
    self.priceMoudle.contentLabel.text = @"6元/h";
    [self.cardView addSubview:self.priceMoudle];
    
    HPFindParkCycleCellMoudleView * count = [HPFindParkCycleCellMoudleView new];
    self.parkCountMoudle = count;
    self.parkCountMoudle.titleLabel.text = @"车位";
    self.parkCountMoudle.contentLabel.text = @"30/100";
    [self.cardView addSubview:self.parkCountMoudle];
    
    HPFindParkCycleCellMoudleView * distance = [HPFindParkCycleCellMoudleView new];
    self.distanceMoudle = distance;
    self.distanceMoudle.titleLabel.text = @"距离";
    self.distanceMoudle.contentLabel.text = @"100m";
    [self.cardView addSubview:self.distanceMoudle];
    
    UIView * line = [UIView new];
    self.lineView = line;
    self.lineView.backgroundColor = [UIColor colorWithWhite:0.27 alpha:1.0];
    [self.cardView addSubview:self.lineView];
    
    UIButton * guiBtn = [UIButton new];
    self.guidanceBtn = guiBtn;
    [self.guidanceBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.guidanceBtn setTitle:@"开始导航" forState:UIControlStateNormal];
    [self.guidanceBtn  setTitleColor:kTextColor_3 forState:UIControlStateNormal];
    self.guidanceBtn.titleLabel.font = kFontSize(15);
    [self.cardView addSubview:self.guidanceBtn];
    
    UIButton * appBtn = [UIButton new];
    self.appointBtn = appBtn;
    [self.appointBtn  setTitleColor:kTextColor_3 forState:UIControlStateNormal];
    self.appointBtn.titleLabel.font = kFontSize(15);
    [self.appointBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.appointBtn setTitle:@"预约车位" forState:UIControlStateNormal];
    [self.cardView addSubview:self.appointBtn];
    [self addMasonryContains];
    
}

-(void)addMasonryContains
{
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardView).offset(16);
        make.left.equalTo(self.cardView).offset(16);
        make.right.lessThanOrEqualTo(self.accImage.mas_left).offset(-4);
    }];
    [self.accImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.cardView).offset(-16);
    }];
    
    [self.priceMoudle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
        make.left.equalTo(self.cardView).offset(16);
        make.height.equalTo(@(40));
        make.width.equalTo(@(70));
    }];
    
    [self.parkCountMoudle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
        make.centerX.equalTo(self.cardView);
        make.height.equalTo(@(40));
        make.width.equalTo(@(70));
    }];
    [self.distanceMoudle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
        make.right.equalTo(self.cardView).offset(-16);
        make.height.equalTo(@(40));
        make.width.equalTo(@(70));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardView.mas_bottom).offset(-50);
        make.right.equalTo(self.cardView).offset(-16);
        make.height.equalTo(@(1));
        make.left.equalTo(self.cardView).offset(16);;
    }];
    
    [self.guidanceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardView.mas_bottom).offset(-5);
        make.height.equalTo(@(40));
        make.left.equalTo(self.cardView).offset(16);;
    }];
    
    [self.appointBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardView.mas_bottom).offset(-5);
        make.height.equalTo(@(40));
        make.right.equalTo(self.cardView).offset(-16);;
    }];
}

@end
