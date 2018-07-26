//
//  HPBaseBaiduMapViewController.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>
#import <BaiduMapAPI_Base/BMKUserLocation.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearchOption.h>
#import "HPBaseAnnotationView.h"
#import "HPPaoPaoView.h"
#import "HPBaseAnnotation.h"


@class HPBasePoiModel, HPPaoPaoView,HPBaseBaiduMapViewController;

@protocol BaiduMapViewPaoPaoViewDelagate <NSObject>

@optional
-(void)BaiduMapView:(HPBaseBaiduMapViewController *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi;

@end


@interface HPBaseBaiduMapViewController : UIView<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,HPPaoPaoViewDelagate>
@property (nonatomic,retain) BMKMapView *mapView;
@property (nonatomic,retain) BMKLocationService *locService;
@property (nonatomic,retain) BMKGeoCodeSearch *geoSearch;

@property (nonatomic, weak) id<BaiduMapViewPaoPaoViewDelagate>  paopaoDelegate;


/** 用户当前位置*/
@property (nonatomic,retain) BMKUserLocation *userLocation;

@property (nonatomic, strong) NSArray  * annotationArray;

/** 当前城市*/
@property (nonatomic, copy) NSString *city;

-(void)viewWillAppear;

-(void)viewDisAppear;


@end
