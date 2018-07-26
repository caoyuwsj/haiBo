//
//  HPSJBaiduMapView.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJBaiduMapView.h"

@implementation HPSJBaiduMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0 , frame.size.width , frame.size.height)];
        [self.mapView setZoomLevel:11];
        self.mapView.delegate = self;
        self.mapView.mapType = BMKMapTypeStandard;
        [self addSubview:self.mapView];
    }
    return self;
}

/**
 *地图渲染完毕后会调用此接口
 *@param mapView 地图View
 */
- (void)mapViewDidFinishRendering:(BMKMapView *)mapView
{
    NSLog(@"dituSucess");
}


@end
