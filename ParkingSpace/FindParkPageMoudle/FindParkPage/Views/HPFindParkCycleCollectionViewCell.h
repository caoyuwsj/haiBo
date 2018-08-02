//
//  HPFindParkCycleCollectionViewCell.h
//  ParkingSpace
//
//  Created by mac on 2018/7/30.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPFindParkCycleCellMoudleView.h"

@interface HPFindParkCycleCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) HPBaseCardView * cardView;

@property (nonatomic, weak) UILabel * titleLabel;

@property (nonatomic, weak) UIImageView * accImage;

@property (nonatomic, weak) HPFindParkCycleCellMoudleView * priceMoudle; //价格
@property (nonatomic, weak) HPFindParkCycleCellMoudleView * parkCountMoudle; //车位数
@property (nonatomic, weak) HPFindParkCycleCellMoudleView * distanceMoudle; //距离

@property (nonatomic, weak) UIView * lineView;

@property (nonatomic, weak) UIButton * guidanceBtn;//导航
@property (nonatomic, weak) UIButton * appointBtn;//预约
@end
