//
//  HPBaseCardView.h
//  ParkingSpace
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCShadowLayer.h"

@interface HPBaseCardView : UIView

@property (nonatomic, strong) UIView * cardBackView;

@property (nonatomic, strong) MDCShadowLayer * shadowLayer;
@end
