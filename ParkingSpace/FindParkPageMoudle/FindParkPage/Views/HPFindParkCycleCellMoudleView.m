//
//  HPFindParkCycleCellMoudleView.m
//  ParkingSpace
//
//  Created by mac on 2018/7/30.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPFindParkCycleCellMoudleView.h"

@implementation HPFindParkCycleCellMoudleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *contentLabel = [UILabel new];
        self.contentLabel = contentLabel;
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.font = kFontSize(15);
        self.contentLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.contentLabel.text = @"30元/h";
        [self  addSubview:self.contentLabel];
        
        UILabel *title = [UILabel new];
        self.titleLabel  = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kFontSize(13);
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.text = @"价格";
        [self  addSubview:self.titleLabel];
        
       
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
    }
    return self;
}


@end
