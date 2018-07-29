//
//  HPMessageInfoListTableViewCell.h
//  ParkingSpace
//
//  Created by mac on 2018/7/29.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBaseCardCell.h"

@interface HPMessageInfoListTableViewCell : HPBaseCardCell

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * statusLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIButton * actionBtn;
@property (nonatomic, strong) UIImageView * accImage;


@end
