//
//  UIViewController+SJNetWorkingLoad.h
//  ParkingSpace
//
//  Created by mac on 2018/7/17.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDNoDataView.h"
@interface UIViewController (SJNetWorkingLoad)<TDNoDataViewDelegate>
@property (nonatomic, assign) BOOL isFirstRequest;
@property (nonatomic, strong) UIView * loadingBackView;

@property (nonatomic, strong) UIImageView * loadingImag;
@property (nonatomic, strong) NSTimer * loadingTime;

@property (nonatomic, strong) TDNoDataView * noDataView;
@property (nonatomic, assign) CGRect nodataFrame;


- (void)loadingBeginAnimationIsPost:(BOOL)ispost;

- (void)loadingFinished;
@end
