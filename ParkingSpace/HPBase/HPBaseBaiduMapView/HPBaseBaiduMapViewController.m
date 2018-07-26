//
//  HPBaseBaiduMapViewController.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseBaiduMapViewController.h"
#import "HPBasePoiModel.h"

@interface HPBaseBaiduMapViewController ()

@end

@implementation HPBaseBaiduMapViewController
#pragma mark - Getters

- (BMKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_mapView setZoomLevel:16]; //3-21级
        _mapView.showMapScaleBar = NO; //显示比例尺
        _mapView.userTrackingMode = BMKUserTrackingModeHeading;//设置定位的状态
        _mapView.showsUserLocation = YES; //显示定位图层

        //定位图层自定义样式
        BMKLocationViewDisplayParam *userlocationStyle = [[BMKLocationViewDisplayParam alloc] init];
        userlocationStyle.isRotateAngleValid = YES;
        userlocationStyle.isAccuracyCircleShow = NO; //不显示精度圈
        [_mapView updateLocationViewWithParam:userlocationStyle];
    }

    return _mapView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mapView];
        
        self.userLocation = [[BMKUserLocation alloc] init];
        self.geoSearch = [[BMKGeoCodeSearch alloc] init];
        
        [self initLocService]; //定位
    }
    return self;
}

#pragma mark - Data

- (void)getData {

    [MBProgressHUD showHUDAddedTo:self animated:YES];

    NSString *urlString = @"http://api.meituan.com/meishi/filter/v4/deal/select/city/1/area/14/cate/1?__skua=58c45e3fe9ccacce6400c5a736b76480&userid=267752722&__vhost=api.meishi.meituan.com&movieBundleVersion=100&wifi-mac=8c%3Af2%3A28%3Afc%3A41%3A92&utm_term=6.5.1&limit=25&ci=1&__skcy=jyDTYwzfsbzflQbUtxRRR1RK2Ag%3D&__skts=1466298960.130064&sort=defaults&__skno=5210AD02-055C-47B7-BD23-A26EB36E2A20&wifi-name=MERCURY_4192&uuid=E158E8C43627D4B0B2BA94FC17DD78F08B7148D4A037A9933F3180FC1E550587&utm_content=E158E8C43627D4B0B2BA94FC17DD78F08B7148D4A037A9933F3180FC1E550587&utm_source=AppStore&version_name=6.5.1&mypos=38.300178%2C116.909954&utm_medium=iphone&wifi-strength=&wifi-cur=0&offset=0&poiFields=cityId%2Clng%2CfrontImg%2CavgPrice%2CavgScore%2Cname%2Clat%2CcateName%2CareaName%2CcampaignTag%2Cabstracts%2Crecommendation%2CpayInfo%2CpayAbstracts%2CqueueStatus&hasGroup=true&utm_campaign=AgroupBgroupD200Ghomepage_category1_1__a1&__skck=3c0cf64e4b039997339ed8fec4cddf05&msid=AE66B26D-47FB-4959-B3F3-FE25606FF0CB2016-06-19-09-1327";

    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [MBProgressHUD hideHUDForView:self animated:YES];

        NSArray *data = responseObject[@"data"];
        NSLog(@"poi信息：%@",data);
        for (NSDictionary *dict in data) {
            NSDictionary *poiDict = dict[@"poi"];
            NSLog(@"poi信息：%@",poiDict);
            HPBasePoiModel *poi = [HPBasePoiModel mj_objectWithKeyValues:poiDict];
            HPBaseAnnotation *annotation = [[HPBaseAnnotation alloc] init];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(poi.lat, poi.lng);
            annotation.coordinate = coordinate;
            annotation.poi = poi;
            [self.mapView addAnnotation:annotation];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self animated:YES];
    }];
}

#pragma mark - 定位(后台持续定位)
- (void)initLocService {

    _locService = [[BMKLocationService alloc] init];
    _locService.delegate = self;
    _locService.distanceFilter = 20;
    _locService.desiredAccuracy = kCLLocationAccuracyBest;

    //这是iOS9中针对后台定位推出的新属性，不设置的话可能会出现顶部蓝条的哦(类似热点连接)
    if (SystemVersion >=9 ) {
        _locService.allowsBackgroundLocationUpdates = NO;
    }

    //设置是否允许系统自动暂停定位，这里要设置为NO，如果没有设置默认为YES，后台定位持续20分钟左右就停止了！
    _locService.pausesLocationUpdatesAutomatically = NO;

    [_locService startUserLocationService];
}

//用户位置更新后，会调用此函数
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {

    [_mapView updateLocationData:userLocation]; //动态更新我的位置数据
    [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES]; //当前地图的中心点
    self.userLocation = userLocation; //用户当前位置
    [self.mapView removeAnnotations:self.annotationArray];
    NSMutableArray * mutarray= [NSMutableArray array];
    for (NSInteger i = 0 ; i < 7; i++)
    {
        CLLocationDegrees currentlan = self.userLocation.location.coordinate.longitude;
        
        CLLocationDegrees currentlat = self.userLocation.location.coordinate.latitude;
        
        HPBasePoiModel *poi = [HPBasePoiModel new];
        int value = arc4random_uniform(7 + 1);
        int random = arc4random_uniform(7 + 1);
        
        poi.lat = currentlat + 0.001*(value +1);
        poi.lng = currentlan + 0.001*(random+1);
        
        HPBaseAnnotation *annotation = [[HPBaseAnnotation alloc] init];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(poi.lat, poi.lng);
        annotation.coordinate = coordinate;
        annotation.poi = poi;
        [mutarray addObject:annotation];
        [self.mapView addAnnotation:annotation];
    }
    self.annotationArray = mutarray.copy;
    
    
    //发起反向地理编码检索
//    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude};
//    BMKReverseGeoCodeSearchOption *searchOption = [[BMKReverseGeoCodeSearchOption alloc] init];
//    searchOption.location = pt;
//    [_geoSearch reverseGeoCode:searchOption];
}

#pragma mark - 接收反向地理编码结果

//-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeSearchResult *)result errorCode:(BMKSearchErrorCode)error
//{
//    if (error == BMK_SEARCH_NO_ERROR) {
////        self.city = result.addressDetail.city;
////        NSLog(@"用户当前位置：{地址：%@ 经度：%f 维度：%f}",result.address,result.location.longitude,result.location.latitude);
//    }
//}



#pragma mark -BMKMapViewDelegate
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    // 创建大头针
    HPBaseAnnotationView *annotationView = [HPBaseAnnotationView annotationViewWithMap:mapView withAnnotation:annotation];
    annotationView.draggable = NO; //不可拖动

    // 绑定大头针上的View视图
    HPPaoPaoView *paopaoView = [[HPPaoPaoView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    paopaoView.delegate = self;
    HPBaseAnnotation *anno = (HPBaseAnnotation *)annotationView.annotation;
    paopaoView.poi = anno.poi;
    annotationView.paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:paopaoView];

    return annotationView;
}

#pragma mark - ZBPaopaoViewDelagate

- (void)paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi {
    NSLog(@"点击泡泡");

    if ([self.paopaoDelegate respondsToSelector:@selector(BaiduMapView:paopaoView:coverButtonClickWithPoi:)])
    {
        [self.paopaoDelegate BaiduMapView:self paopaoView:paopapView coverButtonClickWithPoi:poi];
    }
    
}
- (void)viewWillAppear
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geoSearch.delegate = self;
}
-(void)viewDisAppear
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _geoSearch.delegate = nil;
}


@end
