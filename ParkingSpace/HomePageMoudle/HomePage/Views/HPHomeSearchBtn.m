//
//  HPHomeSearchBtn.m
//  ParkingSpace
//
//  Created by mac on 2018/8/1.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPHomeSearchBtn.h"

@implementation HPHomeSearchBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.searchImage = [UIImageView new];
        self.searchImage.image = [UIImage imageNamed:@"搜索"];
        [self addSubview:self.searchImage];
        
       
        
        self.searchField = [UITextField new];
        self.searchField.placeholder = @"请输入您的目的地";
        self.searchField.clearButtonMode = UITextFieldViewModeAlways;
        self.searchField.font = kFontSize(13);
        self.searchField.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.searchField];
        
        self.searchField.userInteractionEnabled = NO;
        self.userInteractionEnabled = YES;
        
        self.layer.cornerRadius = 4.0;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        [self.searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.centerY.equalTo(self);
            make.width.equalTo(@(14));
        }];
        
        [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.searchImage.mas_right).offset(8);
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-8);
            make.top.equalTo(self);
        }];
    }
    return self;
}

@end
