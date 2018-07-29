//
//  HPBaseCardCell.m
//  ParkingSpace
//
//  Created by mac on 2018/7/29.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBaseCardCell.h"

@implementation HPBaseCardCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.cardView = [[HPBaseCardView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        self.cardView.shadowLayer.elevation = 0.0;
        [self.contentView addSubview:self.cardView];
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(4, 8, 4, 8));
        }];
    }
    return self;
}

@end
