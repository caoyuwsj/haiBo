//
//  TDNoDataView.h
//  Idccapp-iOS
//
//  Created by Ivin on 16/4/21.
//  Copyright © 2016年 LWWTD. All rights reserved.
//

//这个类是View 属性的扩展，扩展成无数据状态


#import <UIKit/UIKit.h>

@protocol TDNoDataViewDelegate <NSObject>
@optional

-(void)noDataViewReloadBtnClick;
-(void)noDataViewUpdataBtnClick;

@end

typedef enum
{
    noDataTypeNomel = 0,  //通用类型;暂无数据
    noDataTypeNoNetWork = 1,  //网络异常
    noDataTypeLoadFaild = 2,  //数据请求异常
    noDataTypeSearchNoData = 3,  //无搜索结果
    noDataTypeNoRemiburseListData = 4,  //无报销列表结果
    noDataTypeNoFileListData = 5,  //无文件列表
    noDataTypeNoMessageListData = 6,  //无消息列表
    noDataTypeNoSetAmountData = 7, // 暂未设置相关金额
    noDataTypeNoNotice = 8, //暂无公告
    noDataTypeNeedUpdata = 9 ,//需要升级
    noDataTypeTaskFaild = 10 , //任务失效
}noDataType;


@class TDBasicViewController;

static UIImageView * noNetImg;
static UILabel * titleLab;
static UIButton * loadBtn;

@interface TDNoDataView : UIView
/** 提示语 */
@property (nonatomic, strong) UILabel * titleLable;
/** 图片 */
@property (nonatomic, strong) UIImageView  * noDataImg;

@property (nonatomic, strong) UIButton * actionBtn;
@property (nonatomic, strong) UIButton * updataBtn;
@property (nonatomic, assign) noDataType noDataType;
@property (nonatomic, assign) id<TDNoDataViewDelegate>  noDataDelegate;

/******------上偏移------******/
@property(nonatomic,assign)CGFloat upOffset;

/**
 
 @param frame frame
 @param promptStr 提示语
 @param imageName 图片名称
 @param baseVC 控制器
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame promptStr:(NSString *)promptStr imageNameStr:(NSString *)imageName fromBaseVc:(TDBasicViewController *)baseVC;



@end
