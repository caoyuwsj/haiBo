//
//  HPSJBaiduMapView.h
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>

@interface HPSJBaiduMapView : UIView <BMKMapViewDelegate>

@property (nonatomic, strong) BMKMapView * mapView;


@end
