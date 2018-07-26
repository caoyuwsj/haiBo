//
//  HPDriverCertifyAltView.h
//  ParkingSpace
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

//车主认证提示首页提示视图

#import <UIKit/UIKit.h>

@class HPDriverCertifyAltView;
@protocol HPDriverCertifyAltViewDelegate <NSObject>
@optional
-(void)certifyAltViewAction:(HPDriverCertifyAltView *)altView ;

@end

@interface HPDriverCertifyAltView : UIView

@property (nonatomic, weak) id<HPDriverCertifyAltViewDelegate>  delegate;
-(void)localLanguageChangedToRefreshUI;
@end
