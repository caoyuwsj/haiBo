//
//  HPCarNumberSelectCollectionViewCell.m
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPCarNumberSelectCollectionViewCell.h"

@implementation HPCarNumberSelectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#E1E1E1"];
        self.contentView.layer.cornerRadius = 4.0;
        self.contentView.clipsToBounds = YES;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor =[UIColor colorWithHexString:@"#333333"];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kFontSize(16);
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
    }
    return self;
}

@end
