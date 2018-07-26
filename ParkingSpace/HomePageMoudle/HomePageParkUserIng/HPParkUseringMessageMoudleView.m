//
//  HPParkUseringMessageMoudleView.m
//  ParkingSpace
//
//  Created by mac on 2018/7/21.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPParkUseringMessageMoudleView.h"

@implementation HPParkUseringMessageMoudleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentLabel = [UILabel new];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        self.contentLabel.font = kFontSize(15);
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.contentLabel.text = @"30分钟";
        [self  addSubview:self.contentLabel];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = kFontSize(13);
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.text = @"30分钟";
        [self  addSubview:self.titleLabel];
        
        self.iconImage = [UIImageView new];
        [self addSubview:self.iconImage];
        
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
        }];
        
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.width.height.equalTo(@(16));
            make.bottom.equalTo(self);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage.mas_right).offset(2);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
    }
    return self;
}

@end
