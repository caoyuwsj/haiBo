//
//  UIViewController+SJNetWorkingLoad.m
//  ParkingSpace
//
//  Created by mac on 2018/7/17.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "UIViewController+SJNetWorkingLoad.h"

@implementation UIViewController (SJNetWorkingLoad)
static const char * FirstRequestKey = "FirstRequestKey";
static const char * loadingBackViewKey = "loadingBackView";
static const char * loadingImagKey = "loadingImag";
static const char * loadingTimeKey = "loadingTime";
static const char * noDataViewKey = "noDataView";
static const char * nodataFrameKey = "nodataFrame";


- (BOOL )isFirstRequest {
    NSNumber *number = objc_getAssociatedObject(self, FirstRequestKey);
    
    return  [number boolValue];
}

-(void)setIsFirstRequest:(BOOL)isFirstRequest
{
    objc_setAssociatedObject(self, FirstRequestKey, @(isFirstRequest), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect )nodataFrame {
//
//    NSDictionary *framedic = objc_getAssociatedObject(self, nodataFrameKey);
//    if (framedic)
//    {
//        CGFloat x = [[framedic objectForKey:@"x"] doubleValue];
//        CGFloat y = [[framedic objectForKey:@"y"] doubleValue];
//        CGFloat w = [[framedic objectForKey:@"w"] doubleValue];
//        CGFloat h = [[framedic objectForKey:@"h"] doubleValue];
//        CGRect frame = CGRectMake(x, y, w, h);
//        return frame;
//    }
//    else
//    {
//        CGRect frame = CGRectMake(0, Current_Status_Bar_Hight + kMDCAppBarHight, MainScreen.width, MainScreen.height - (Current_Status_Bar_Hight + kMDCAppBarHight));
//        [self setNodataFrame:frame];
//        return frame;
//    }
    return CGRectZero;
}

-(void)setNodataFrame:(CGRect)nodataFrame
{
    NSMutableDictionary * frameDic = [NSMutableDictionary dictionary];
    [frameDic setObject:@(nodataFrame.origin.x) forKey:@"x"];
    [frameDic setObject:@(nodataFrame.origin.y) forKey:@"y"];
    [frameDic setObject:@(nodataFrame.size.width) forKey:@"w"];
    [frameDic setObject:@(nodataFrame.size.height) forKey:@"h"];
    
    objc_setAssociatedObject(self, nodataFrameKey, frameDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView * )loadingBackView {
    
    UIView * _loadingBackview = objc_getAssociatedObject(self, loadingBackViewKey);
    if (_loadingBackview == nil)
    {
        _loadingBackview  = [[UIView alloc] initWithFrame:self.nodataFrame];
        
        _loadingBackview.backgroundColor = [UIColor whiteColor];
        _loadingBackview.hidden =YES;
        
        [self setLoadingBackView:_loadingBackview];
        
    }
    return _loadingBackview;
}

-(void)setLoadingBackView:(UIView *)loadingBackView
{
    objc_setAssociatedObject(self, loadingBackViewKey, loadingBackView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView * )loadingImag {
    
    UIImageView * _loadingImag = objc_getAssociatedObject(self, loadingImagKey);
    if (_loadingImag == nil)
    {
        _loadingImag = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2.0 - 15, 0, 30, 30)];
        //        _loadingImag.center = self.noDataView.center;
        [self.view addSubview:_loadingImag];
        _loadingImag.hidden = YES;
        [self setLoadingImag:_loadingImag];
    }
    return _loadingImag;
}

-(void)setLoadingImag:(UIView *)loadingImag
{
    objc_setAssociatedObject(self, loadingImagKey, loadingImag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimer *)loadingTime {
    
    return  objc_getAssociatedObject(self, loadingTimeKey);
}

-(void)setLoadingTime:(NSTimer *)loadingTime
{
    objc_setAssociatedObject(self, loadingTimeKey, loadingTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TDNoDataView * )noDataView {
    
    TDNoDataView * _noDataView = objc_getAssociatedObject(self, noDataViewKey);
    if (_noDataView == nil)
    {
        _noDataView = [[TDNoDataView alloc] initWithFrame:self.nodataFrame promptStr:@"暂无数据" imageNameStr:@"defaultpage_pic_data" fromBaseVc:nil];
        _noDataView.actionBtn.hidden = YES;
        [self setNoDataView:_noDataView];
    }
    return _noDataView;
}

-(void)setNoDataView:(TDNoDataView *)noDataView
{
    objc_setAssociatedObject(self, noDataViewKey, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)loadingBeginAnimationIsPost:(BOOL)ispost
{
    __block NSInteger i =1;
    if (ispost)
    {
        self.loadingBackView.hidden = YES;
    }
    else
    {
        self.loadingBackView.hidden = YES;
        if (self.isFirstRequest)
        {
            self.loadingBackView.hidden = NO;
            [self.view addSubview:self.loadingBackView];
            [self.view bringSubviewToFront:self.loadingBackView];
        }
    }
    self.loadingImag.hidden = NO;
    [self.view bringSubviewToFront:self.loadingImag];
    
    if(self.loadingTime.valid)
    {
        [self.loadingTime invalidate];
    }
    //    self.loadingTime =  [NSTimer scheduledTimerWithTimeInterval:0.14 block:^(NSTimer * _Nonnull timer)
    //    {
    //        if (i== 9)
    //        {
    //            i=1;
    //        }
    //        self.loadingImag.image = [UIImage imageNamed:[NSString stringWithFormat:@"loading2_%zd",i]];
    //        i++;
    //    }
    //    repeats:YES];
}


-(void)loadingFinished
{
    [self.loadingTime invalidate];
    self.loadingImag.hidden = YES;
    self.loadingBackView.hidden =YES;
}


@end
