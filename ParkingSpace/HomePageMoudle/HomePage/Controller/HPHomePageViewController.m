//
//  HPHomePageViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageViewController.h"
#import "HPSJSySActionView.h"
#import "HPSJBaiduMapView.h"
#import "HPSJVerticalSegmenView.h"
#import "QRScanViewController.h"
#import "HPHomePageInputParkNumberViewController.h"
#import "HPMessageListViewController.h"
#import "HPDriverCertifyAltView.h"
#import "HPBindCarNumberViewController.h"
#import "HPMeeasgeItemView.h"
#import "HPBaseBaiduMapViewController.h"
#import "VerifyViewController.h"
#import "HPGoogleMapView.h"
#import "HPParkCostDetailViewController.h"



@interface HPHomePageViewController ()<HPSJVerticalSegmenViewDelegate,HPSJSySActionViewDelegate,HPDriverCertifyAltViewDelegate,GoogleMapViewPaoPaoViewDelagate,BaiduMapViewPaoPaoViewDelagate>

@property (nonatomic, strong) HPSJSySActionView * sysActionView;

@property (nonatomic, strong) HPSJVerticalSegmenView * typeSegment;
@property (nonatomic, strong) HPSJVerticalSegmenView * bigSegment;

@property (nonatomic, strong) HPBaseBaiduMapViewController * baiduMapView;
@property (nonatomic, strong) HPGoogleMapView * googleMapView;

@property (nonatomic, strong) UISearchBar * searchBar;


@property (nonatomic, strong) UIButton * curentLocationBtn;

@property (nonatomic, strong) HPDriverCertifyAltView * altView;

@end

@implementation HPHomePageViewController
#pragma -mark  懒加载
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


-(UIButton *)curentLocationBtn
{
    if (!_curentLocationBtn)
    {
        _curentLocationBtn = [UIButton new];
        [_curentLocationBtn setBackgroundImage:[UIImage imageNamed:@"定位地图"] forState:UIControlStateNormal];
        [_curentLocationBtn addTarget:self action:@selector(curentLocationBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _curentLocationBtn;
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

-(HPSJSySActionView *)sysActionView
{
    if (_sysActionView == nil)
    {
        _sysActionView = [[HPSJSySActionView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 180 - 49, SCREEN_WIDTH, 180)];
        _sysActionView.delegate = self;
    }
    return _sysActionView;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self presentToBindingCarNumverVc];
    self.navigationController.navigationBar.hidden = YES;

}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setMessageRightItem];
//    [self.view addSubview:self.sysActionView];
//    [_sysActionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-49);
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@(180));
//    }];

    [self setUpMapView];
    
//    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 56 - 56, 22)];
//    self.searchBar.searchBarStyle = UISearchBarStyleDefault;
//    self.searchBar.placeholder = @"请输入您的目的地";
//    self.navigationItem.titleView  = self.searchBar;
//

    [self.view addSubview:self.curentLocationBtn];
    [self.curentLocationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(16);
        make.width.height.equalTo(@(50));
        make.bottom.equalTo(self.bigSegment.mas_bottom);
    }];
    
    self.altView = [[HPDriverCertifyAltView alloc] init];
    self.altView.delegate = self;
    
    [self.view addSubview:self.altView];
    
    [self.altView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64 +15);
        make.width.equalTo(@(SCREEN_WIDTH - 60));
        make.centerX.equalTo(self.view);
        make.height.equalTo(@(40));
    }];
//    [self getData];
    
    self.ls_navigationController.navigationBar.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localLanguageChanged:) name:ChangeLang object:nil];
    
    
}
-(void)setUpMapView
{
 
    if (isChineseLanguage)
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

-(void)rightBarItemAction:(UIBarButtonItem *)sender
{
    HPMessageListViewController * messageListVc = [HPMessageListViewController new];
    messageListVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:messageListVc animated:YES];
}
#pragma mark - 获取数据
//获取数据
-(void)getData
{
    //选填项
    NSMutableDictionary * optionDic = [NSMutableDictionary dictionary];
    [optionDic setObject:@"wondshj" forKey:@"option"];
    //必填项
    NSMutableDictionary * mustdic = [NSMutableDictionary dictionary];
    [mustdic setObject:@"+86" forKey:@"areacode"];
    [mustdic setObject:@"7893" forKey:@"username"];
    [mustdic setObject:@"432f" forKey:@"code"];
    NSString * url = API_Login;

    //发起请求 token 的生成目前没有加userkey;本地保存之后会加上

    [HPNetWorking postJSONWithUrl:url mustParameters:mustdic optionParameters:optionDic success:^(id result) {

    } fail:^(NSError *error) {

    } viewController:self ForMethod:NetworkRequestMethodTypeGetData nodataViewAddInSuperView:self.view];
    

}



#pragma mark - 扫码
//扫描
- (void)HPSJSySActionView:(HPSJSySActionView *)view scanBtnClick:(UIButton *)sender
{

    QRScanViewController * scanVc = [QRScanViewController new];
    scanVc.delegate = self;
    [kAppDelegate.maintabBar presentViewController:scanVc animated:YES completion:^{

    }];
}
#pragma mark - 扫码结果
//扫码结果
- (void)qrScanResult:(NSString *)result viewController:(QRScanViewController *)qrScanVC
{

}
#pragma mark - 手动输入
//手动输入
- (void)qrScanInputBtnClick:(UIButton *)btn viewController:(QRScanViewController *)qrScanVC
{
    HPHomePageInputParkNumberViewController * inputVc = [HPHomePageInputParkNumberViewController new];
    inputVc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.001];
    //关键语句，必须有
    inputVc.modalPresentationStyle = UIModalPresentationOverFullScreen;

    [kAppDelegate.maintabBar presentViewController:inputVc animated:NO completion:^{

        self.navigationController.navigationBar.hidden = YES;
        inputVc.view.superview.backgroundColor = [UIColor clearColor];
    }];
}

#pragma mark -点击气泡
//谷歌
-(void)GoogleMapView:(HPGoogleMapView *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi
{
    [self presentToParkDetailVc];
}
//百度
-(void)BaiduMapView:(HPBaseBaiduMapViewController *)mapView  paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi
{
    [self presentToParkDetailVc];
}


#pragma mark - 当前定位
//当前定位
-(void)curentLocationBtnAction:(UIButton *)sender
{

    if (isChineseLanguage)
    {
        [self.baiduMapView.mapView setCenterCoordinate:self.baiduMapView.userLocation.location.coordinate animated:YES]; //当前地图的中心点
    }
    else
    {
        self.googleMapView.googleMapView.camera = [[GMSCameraPosition alloc] initWithTarget:self.googleMapView.currentLocation.coordinate zoom:15 bearing:0 viewingAngle:0];
    }
}
#pragma mark - 实名认证
//实名认证

-(void)certifyAltViewAction:(HPDriverCertifyAltView *)altView
{
//    [self presentToBindingCarNumverVc];
    UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UIViewController* verVC = [loginStoryboard instantiateViewControllerWithIdentifier:@"RealNameTableViewController"];
    
 
//    VerifyViewController * verVC= [VerifyViewController new];
    verVC.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController pushViewController:verVC animated:YES];
    
    
}

#pragma mark - 地图放大缩小
//地图放大缩小
-(void)segmenView:(HPSJVerticalSegmenView *)segmentView selectIndex:(NSInteger)index
{
    if (segmentView == self.bigSegment)
    {
        CGFloat leavel = 0;
        if (isChineseLanguage)
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
        if (isChineseLanguage)
        {
            [self.baiduMapView.mapView setZoomLevel:leavel];
        }
        else
        {
            GMSCameraPosition * position = self.googleMapView.googleMapView.camera;
            
            GMSMutableCameraPosition * mutcam =  [[GMSMutableCameraPosition alloc] initWithTarget:position.target zoom:position.zoom bearing:position.bearing viewingAngle:position.viewingAngle];
             mutcam.zoom = leavel;
            self.googleMapView.googleMapView.camera = mutcam;
            self.googleMapView.currentZoom = leavel;
        }
    }
}
#pragma mark - 绑定车牌
//绑定车牌
-(void)presentToBindingCarNumverVc
{
    HPBindCarNumberViewController * bindcarVc = [HPBindCarNumberViewController new];
    bindcarVc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    //关键语句，必须有
    bindcarVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [kAppDelegate.maintabBar presentViewController:bindcarVc animated:NO completion:^{
        bindcarVc.view.superview.backgroundColor = [UIColor clearColor];
    }];
}

-(void)setMessageRightItem
{
    HPMeeasgeItemView * itemView = [[HPMeeasgeItemView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [itemView addTarget:self action:@selector(rightBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (isChineseLanguage)
    {
        [self.baiduMapView viewWillAppear];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (isChineseLanguage)
    {
        [self.baiduMapView viewDisAppear];
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
    [self.altView localLanguageChangedToRefreshUI];

    [self.view bringSubviewToFront:self.curentLocationBtn];
    [self.view bringSubviewToFront:self.bigSegment];
    [self.view bringSubviewToFront:self.typeSegment];
    [self.view bringSubviewToFront:self.altView];
}

#pragma mark - 车场详情
-(void)presentToParkDetailVc
{
    HPParkCostDetailViewController * bindcarVc = [HPParkCostDetailViewController new];
    bindcarVc.view.backgroundColor=[UIColor lightGrayColor];
    //关键语句，必须有
    bindcarVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [kAppDelegate.maintabBar presentViewController:bindcarVc animated:NO completion:^{
        bindcarVc.view.superview.backgroundColor = [UIColor clearColor];

    }];
}


@end
