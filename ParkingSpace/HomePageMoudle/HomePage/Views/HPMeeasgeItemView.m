//
//  HPMeeasgeItemView.m
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPMeeasgeItemView.h"

@implementation HPMeeasgeItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImageView new];
        self.image.image = [UIImage imageNamed:@"消息"];
        [self addSubview:self.image];
        
        UILabel * label = [UILabel new];
        self.countLabel = label;
        self.countLabel.backgroundColor = [UIColor redColor];
        self.countLabel.layer.cornerRadius = 6.0;
        self.countLabel.font = kFontSize(10);
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.text = @"1";
        self.countLabel.textColor = [UIColor whiteColor];
        self.countLabel.clipsToBounds = YES;
        [self addSubview:self.countLabel];
        
        [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.height.equalTo(@(21));
        }];
        
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.image).offset(10.5);
            make.centerY.equalTo(self.image).offset(-10.5);
            make.width.height.equalTo(@(12));
        }];
        
    }
    return self;
}

@end
