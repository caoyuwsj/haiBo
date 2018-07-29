//
//  HPMessageInfoListTableViewCell.m
//  ParkingSpace
//
//  Created by mac on 2018/7/29.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPMessageInfoListTableViewCell.h"

@implementation HPMessageInfoListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F5F8FC"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = kFontSize(18);
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.cardView addSubview:self.titleLabel];
        
        self.statusLabel = [UILabel new];
        self.statusLabel.font = kFontSize(14);
        self.statusLabel.textColor = [UIColor redColor];
        self.statusLabel.textAlignment = NSTextAlignmentRight;
        [self.cardView addSubview:self.statusLabel];
        
        self.contentLabel = [UILabel new];
        self.contentLabel.font = kFontSize(14);
        self.contentLabel.textColor = [UIColor colorWithWhite:0.54 alpha:1.0];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        [self.cardView addSubview:self.contentLabel];
        
        self.lineView = [UIView new];
        self.lineView.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
        [self.cardView addSubview:self.lineView];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.font = kFontSize(12);
        self.timeLabel.textColor = [UIColor colorWithWhite:0.54 alpha:1.0];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.cardView addSubview:self.timeLabel];
        
        
        self.actionBtn = [UIButton new];
        [self.actionBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        self.actionBtn.titleLabel.font = kFontSize(12);
        [self.cardView addSubview:self.actionBtn];
        
        [self.actionBtn setTitleColor:[UIColor colorWithWhite:0.54 alpha:1.0] forState:UIControlStateNormal];
        
        self.accImage = [UIImageView new];
        self.accImage.image = [UIImage imageNamed:@"更多"];
        [self.cardView addSubview:self.accImage];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cardView).offset(12);
            make.left.equalTo(self.cardView).offset(16);
            make.right.lessThanOrEqualTo(self.statusLabel.mas_left).offset(-8);
        }];
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.right.equalTo(self.cardView).offset(-16);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
            make.left.equalTo(self.cardView).offset(16);
            make.right.equalTo(self.cardView).offset(-16);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cardView).offset(16);
            make.right.equalTo(self.cardView).offset(-16);
            make.height.equalTo(@(1));
            make.bottom.equalTo(self.cardView).offset(-50);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cardView).offset(16);
            make.bottom.equalTo(self.cardView);
            make.top.equalTo(self.lineView.mas_bottom);
        }];
        [self.accImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLabel);
            make.right.equalTo(self.cardView).offset(-16);
        }];
        [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLabel);
            make.right.equalTo(self.accImage.mas_left).offset(-8);
        
        }];
        
        
    }
    return self;
}

@end
