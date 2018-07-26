//
//  HPGoogleMapView.h
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <GoogleMapsBase/GoogleMapsBase.h>
#import <GooglePlaces/GooglePlaces.h>
#import "HPPaoPaoView.h"

@class HPBasePoiModel, HPPaoPaoView,HPGoogleMapView;

@protocol GoogleMapViewPaoPaoViewDelagate <NSObject>
@optional
-(void)GoogleMapView:(HPGoogleMapView *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi;

@end

@interface HPGoogleMapView : UIView<GMSMapViewDelegate,CLLocationManagerDelegate,HPPaoPaoViewDelagate>

@property (nonatomic, strong) GMSMapView * googleMapView;
@property (nonatomic, strong) CLLocationManager *loacationManager;
@property (nonatomic, strong) CLLocation *currentLocation ;
@property (nonatomic, strong) GMSCameraPosition *currentCamer ;

@property (nonatomic, weak) id<GoogleMapViewPaoPaoViewDelagate>  paopaoDeleagte;

@property (nonatomic, assign) CGFloat  currentZoom;
@property (nonatomic, strong) NSArray * mapMarkArray;

@end
