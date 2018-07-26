//
//  HPBaseAnnotationView.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface HPBaseAnnotationView : BMKAnnotationView
/**
 *  创建方法
 *
 *  @param mapView 地图
 *
 *  @return 大头针
 */
+ (instancetype)annotationViewWithMap:(BMKMapView *)mapView withAnnotation:(id <BMKAnnotation>)annotation;

@end
