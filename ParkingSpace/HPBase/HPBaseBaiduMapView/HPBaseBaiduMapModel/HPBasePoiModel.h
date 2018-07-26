//
//  HPBasePoiModel.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPBasePoiModel : NSObject
/** 地区名称*/
@property (nonatomic, copy) NSString *areaName;
/** 平均价格*/
@property (nonatomic, copy) NSString *avgPrice;
/** 评分*/
@property (nonatomic, copy) NSString *avgScore;
/** 标签*/
@property (nonatomic, copy) NSString *campaignTag;
/** 美食名称*/
@property (nonatomic, copy) NSString *cateName;
/** 频道*/
@property (nonatomic, copy) NSString *channel;
/** 展示图片*/
@property (nonatomic, copy) NSString *frontImg;
/** 纬度*/
@property (nonatomic, assign) double lat;
/** 经度*/
@property (nonatomic, assign) double lng;
/** 店名*/
@property (nonatomic, copy) NSString *name;

@end
