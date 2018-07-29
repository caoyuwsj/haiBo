//
//  HPSJMessageListTableViewCell.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJMessageListTableViewCell.h"

@implementation HPSJMessageListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F5F8FC"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@""];
        [self.cardView addSubview:self.iconImage];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = kFontSize(17);
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.cardView addSubview:self.titleLabel];
        
        
        self.countLabel = [UILabel new];
        self.countLabel.font = kFontSize(17);
        self.countLabel.textColor = [UIColor whiteColor];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.backgroundColor = [UIColor redColor];
        self.countLabel.layer.cornerRadius  =10.0;
        self.countLabel.clipsToBounds = YES;
        [self.cardView addSubview:self.countLabel];
        
        self.accIamge = [UIImageView new];
        self.accIamge.image = [UIImage imageNamed:@"更多"];
        [self.cardView addSubview:self.accIamge];
        
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cardView);
            make.left.equalTo(self.cardView).offset(16);
            make.height.width.equalTo(@(40));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cardView);
            make.left.equalTo(self.iconImage.mas_right).offset(8);
            make.right.lessThanOrEqualTo(self.countLabel.mas_left).offset(-8);
        }];
        
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cardView);
            make.right.equalTo(self.accIamge.mas_left).offset(-8);
            make.height.width.equalTo(@(20));
        }];
        [self.accIamge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cardView);
            make.right.equalTo(self.cardView).offset(-16);
        }];
        

    }
    return self;
}

@end
