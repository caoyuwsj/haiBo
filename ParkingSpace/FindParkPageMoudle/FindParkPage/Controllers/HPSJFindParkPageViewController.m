//
//  HPSJFindParkPageViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJFindParkPageViewController.h"
#import "HPSJVerticalSegmenView.h"
#import "HPBaseBaiduMapViewController.h"
#import "HPGoogleMapView.h"
#import "HPFindParkCycleCollectionViewCell.h"

#import "TYCyclePagerView.h"
@interface HPSJFindParkPageViewController ()<HPSJVerticalSegmenViewDelegate,GoogleMapViewPaoPaoViewDelagate,BaiduMapViewPaoPaoViewDelagate,TYCyclePagerViewDataSource,
TYCyclePagerViewDelegate>

@property (nonatomic, strong) HPSJVerticalSegmenView * typeSegment;
@property (nonatomic, strong) HPSJVerticalSegmenView * bigSegment;

@property (nonatomic, strong) HPBaseBaiduMapViewController * baiduMapView;
@property (nonatomic, strong) HPGoogleMapView * googleMapView;

/******------pageFlowView------******/
@property(nonatomic,weak)TYCyclePagerView *pageFlowView;

@end
@implementation HPSJFindParkPageViewController

//谷歌地图
-(HPGoogleMapView *)googleMapView
{
    if (!_googleMapView)
    {
        _googleMapView = [[HPGoogleMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kTabBarHeight)];
        _googleMapView.paopaoDeleagte = self;
    }
    return _googleMapView;
}
//百度地图
-(HPBaseBaiduMapViewController *)baiduMapView
{
    if (!_baiduMapView)
    {
        _baiduMapView = [[HPBaseBaiduMapViewController alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kTabBarHeight)];
        _baiduMapView.paopaoDelegate = self;
        
    }
    return _baiduMapView;
}


-(HPSJVerticalSegmenView *)typeSegment
{
    if (!_typeSegment)
    {
        _typeSegment = [[HPSJVerticalSegmenView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 130, 50, 150) actionTitleArray:@[CustomStr(@"个人"),CustomStr(@"商业"),CustomStr(@"公共")]];
        _typeSegment.delegate = self;
    }
    return _typeSegment;
}

-(HPSJVerticalSegmenView *)bigSegment
{
    if (!_bigSegment)
    {
        _bigSegment = [[HPSJVerticalSegmenView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 340, 50, 100) actionImageArray:@[@"加",@"减"]];
        _bigSegment.delegate = self;
    }
    return _bigSegment;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpMapView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localLanguageChanged:) name:ChangeLang object:nil];
    
    TYCyclePagerView *pageFlowView = [[TYCyclePagerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - kTabBarHeight - 190, SCREEN_WIDTH, 180)];
    self.pageFlowView = pageFlowView;
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.isInfiniteLoop = NO;
    pageFlowView.autoScrollInterval = 0;
    [pageFlowView registerClass:[HPFindParkCycleCollectionViewCell class] forCellWithReuseIdentifier:@"pageFlowViewCellId"];
     [self.view addSubview:pageFlowView];
    self.navigationController.navigationBar.hidden = YES;
    [self.pageFlowView reloadData];
    [self.pageFlowView removeTimer];
    
}
-(void)setUpMapView
{
    
    if (!isGoogleMap)
    {
        [self.view addSubview:self.baiduMapView];
    }
    else
    {
        [self.view addSubview:self.googleMapView];
    }
    [self.view addSubview:self.typeSegment];
    [self.view addSubview:self.bigSegment];
    
}
#pragma mark -点击气泡
//谷歌
-(void)GoogleMapView:(HPGoogleMapView *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi
{
    //[self presentToParkDetailVc];
}
//百度
-(void)BaiduMapView:(HPBaseBaiduMapViewController *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi
{
    //[self presentToParkDetailVc];
}
#pragma mark - 地图放大缩小
//地图放大缩小
-(void)segmenView:(HPSJVerticalSegmenView *)segmentView selectIndex:(NSInteger)index
{
    if (segmentView == self.bigSegment)
    {
        CGFloat leavel = 0;
        if (!isGoogleMap)
        {
            leavel = self.baiduMapView.mapView.zoomLevel;
        }
        else
        {
            GMSCameraPosition * position = self.googleMapView.googleMapView.camera;
            
            GMSMutableCameraPosition * mutcam =  [[GMSMutableCameraPosition alloc] initWithTarget:position.target zoom:position.zoom bearing:position.bearing viewingAngle:position.viewingAngle];
            leavel = mutcam.zoom;
        }
        if (index == 0)
        {
            leavel ++;
        }
        else
        {
            leavel --;
        }
        if (!isGoogleMap)
        {
            [self.baiduMapView.mapView setZoomLevel:leavel];
        }
        else
        {
            GMSCameraPosition * position = self.googleMapView.googleMapView.camera;
            
            GMSMutableCameraPosition * mutcam =  [[GMSMutableCameraPosition alloc] initWithTarget:position.target zoom:position.zoom bearing:position.bearing viewingAngle:position.viewingAngle];
            mutcam.zoom = leavel;
            
            [self.googleMapView.googleMapView animateToCameraPosition:mutcam];
            self.googleMapView.currentZoom = leavel;
        }
    }
}


#pragma mark - 切换语言通知更换地图
-(void)localLanguageChanged:(NSNotification *)noti
{
    NSString * language = [noti.userInfo objectForKey:ChangeLang];
    if ([language isEqualToString:@"zh_CN"])
    {
        [self.googleMapView.googleMapView clear];
        [self.googleMapView.googleMapView removeFromSuperview];
        self.googleMapView.googleMapView = nil;
        [self.googleMapView removeFromSuperview];
        self.googleMapView = nil;
        [self.view addSubview:self.baiduMapView];
        [self.baiduMapView viewWillAppear];
    }else
    {
        [self.baiduMapView viewDisAppear];
        [self.baiduMapView.mapView removeAllSubviews];
        [self.baiduMapView.mapView removeFromSuperview];
        self.baiduMapView.mapView = nil;
        [self.baiduMapView removeFromSuperview];
        self.baiduMapView = nil;
        [self.view addSubview:self.googleMapView];
    }
    
    [self.typeSegment localLanguageChangedToRefreshUI];
    
    [self.view bringSubviewToFront:self.bigSegment];
    [self.view bringSubviewToFront:self.typeSegment];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!isGoogleMap)
    {
        [self.baiduMapView viewWillAppear];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!isGoogleMap)
    {
        [self.baiduMapView viewDisAppear];
    }
}


#pragma mark - 滚动视图第三方代理
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return 4;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    HPFindParkCycleCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"pageFlowViewCellId" forIndex:index];
//
//    [cell.imageView setImageWithURL:[NSURL URLWithString:self.model.companyBanner[index]] placeholder:[UIImage imageNamed:@"home_reimbursement_icon_load"]];
//
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView
{
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    

    {
        layout.layoutType = TYCyclePagerTransformLayoutNormal;
        layout.isInfiniteLoop = NO;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH - 48.0f, 180);
        layout.itemSpacing = 8;
        layout.itemHorizontalCenter = YES;
    }
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    [self.pageFlowView removeTimer];
}
#pragma mark - 必须实现,不然会崩溃,第三方没处理好 -By Royal
-(void)pagerViewDidScroll:(TYCyclePagerView *)pageView
{
    [self.pageFlowView removeTimer];
}


@end
