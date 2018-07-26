//
//  HPGoogleMapView.m
//  ParkingSpace
//
//  Created by HZ1280 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPGoogleMapView.h"

@implementation HPGoogleMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        /*
         地图初始化
         **/
        self.googleMapView = [[GMSMapView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.googleMapView.delegate = self;
        
        self.googleMapView.indoorEnabled = NO;
        self.googleMapView.settings.rotateGestures = NO;
        self.googleMapView.settings.tiltGestures = NO;
        self.googleMapView.settings.myLocationButton = NO;
        self.googleMapView.myLocationEnabled = YES;
        [self addSubview:self.googleMapView];
        
        _loacationManager = [[CLLocationManager alloc] init];
        _loacationManager.delegate  = self;
        
        _loacationManager.desiredAccuracy=kCLLocationAccuracyBest;
        //定位频率,每隔多少米定位一次
        CLLocationDistance distance=10.0;//十米定位一次
        _loacationManager.distanceFilter=distance;
        
        [_loacationManager requestWhenInUseAuthorization];
        //启动跟踪定位
        [_loacationManager startUpdatingLocation];

        
    }
    return self;
}


#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    /**
     *    拿到授权发起定位请求
     
     */
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_loacationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    /**
     * 位置更新时调用
     */
    CLLocation *currentLocation = locations.firstObject;
    _googleMapView.camera = [[GMSCameraPosition alloc] initWithTarget:currentLocation.coordinate zoom:15 bearing:0 viewingAngle:0];
    self.currentLocation = currentLocation;
    [_loacationManager stopUpdatingLocation];
    [self updateLocViewPosistion];
}



#pragma mark - private method
- (void)updateLocViewPosistion{
    
    
    NSMutableArray * mutarray= [NSMutableArray array];

        
        for (NSInteger i = 0 ; i < 7; i++)
        {
            CLLocationDegrees currentlan = self.currentLocation.coordinate.longitude;
            
            CLLocationDegrees currentlat = self.currentLocation.coordinate.latitude;

            int value = arc4random_uniform(7 + 1);
            int random = arc4random_uniform(7 + 1);

            GMSMarker *mark = [[GMSMarker alloc] init];
            mark.icon = [UIImage imageNamed:@"停车场图标"];
            
            CLLocationDegrees nLang = currentlan + 0.001*(value +1);
            
            CLLocationDegrees nLat = currentlat + 0.001*(random+1);
            
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(nLat, nLang);
            mark.position = coordinate;
            mark.title = @"10 $/h";
        
            
            mark.map = self.googleMapView;
            //坐标转换
            [mutarray addObject:mark];
 
        }
        self.mapMarkArray = mutarray.copy;

    
}



- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position{
    
    
    //中间视图位置改变
    //反向地理编码
    [[GMSGeocoder geocoder]reverseGeocodeCoordinate:position.target completionHandler:^(GMSReverseGeocodeResponse * response, NSError * error) {
        if (response.results) {
            GMSAddress *address = response.results[0];
            NSLog(@"%@",address.thoroughfare);
            
            
        }
    }];
}

-(UIView *)mapView:(GMSMapView *)mapView markerInfoContents:(GMSMarker *)marker
{
    HPPaoPaoView * paopao = [[HPPaoPaoView alloc] initWithFrame:CGRectMake(200, 200, 100, 40)];
    paopao.delegate = self;
    return paopao;
   
}

-(UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker
{
    HPPaoPaoView * paopao = [[HPPaoPaoView alloc] initWithFrame:CGRectMake(200, 200, 100, 40)];
    paopao.delegate = self;
    return paopao;
}

-(void)paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi;
{
    if ([self.paopaoDeleagte respondsToSelector:@selector(GoogleMapView:paopaoView:coverButtonClickWithPoi:)])
    {
        [self.paopaoDeleagte GoogleMapView:self paopaoView:paopapView coverButtonClickWithPoi:poi];
    }
}
-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker

{
    
}




@end
