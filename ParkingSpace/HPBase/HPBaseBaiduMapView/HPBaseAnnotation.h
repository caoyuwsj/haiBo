//
//  HPBaseAnnotation.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
@class HPBasePoiModel;
@interface HPBaseAnnotation : BMKPointAnnotation
/** poi*/
@property (nonatomic,retain) HPBasePoiModel *poi;

/** 标注点的protocol，提供了标注类的基本信息函数*/
@property (nonatomic,weak) id<BMKAnnotation> delegate;

@end
