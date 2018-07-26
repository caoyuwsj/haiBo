//
//  HPSJVerticalSegmenView.h
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPSJVerticalSegmenView;
@protocol HPSJVerticalSegmenViewDelegate <NSObject>
@optional
-(void)segmenView:(HPSJVerticalSegmenView *)segmentView selectIndex:(NSInteger)index;

@end

@interface HPSJVerticalSegmenView : HPBaseCardView

@property (nonatomic, weak) id <HPSJVerticalSegmenViewDelegate> delegate;
@property (nonatomic, strong) NSArray *  actionTitleArray;
@property (nonatomic, strong) NSArray *  actionImageArray;

-(instancetype)initWithFrame:(CGRect)frame actionTitleArray:(NSArray *)actionTitleArray;

-(instancetype)initWithFrame:(CGRect)frame actionImageArray:(NSArray *)actionIamgeArray;

-(void)localLanguageChangedToRefreshUI;

@end
