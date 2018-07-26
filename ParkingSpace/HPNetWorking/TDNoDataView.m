//
//  TDNoDataView.m
//  Idccapp-iOS
//
//  Created by Ivin on 16/4/21.
//  Copyright © 2016年 LWWTD. All rights reserved.
//

#import "TDNoDataView.h"

@interface TDNoDataView ()
{
    UIViewController * _Vc;
}
@property (nonatomic, strong) NSString * promptStr;
@property (nonatomic, strong) NSString * imageName;

@end

@implementation TDNoDataView

-(instancetype)initWithFrame:(CGRect)frame promptStr:(NSString *)promptStr imageNameStr:(NSString *)imageName fromBaseVc:(TDBasicViewController *)baseVC
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.upOffset = 0.0f;
        self.promptStr = promptStr;
        self.imageName = imageName;
        self.noDataDelegate = baseVC;
        [self initSubViews];
        self.noDataType = noDataTypeNomel;
    }
    return self;
}
-(void)initSubViews
{
    self.noDataImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0 - 86, 80, 172, 172)];
    AppDelegate * app = kAppDelegate;
    self.noDataImg.bounds = CGRectMake(self.frame.size.width/2.0 - 86, app.window.center.y - 46 , 172, 172);
    
    if (self.imageName && self.imageName.length > 0)
    {
        self.noDataImg.image = [UIImage imageNamed:self.imageName];
    }
    
    [self addSubview:self.noDataImg];
    
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.noDataImg.frame)+ 24, self.frame.size.width, 20)];
    
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.text = self.promptStr;
    [self addSubview:self.titleLable];
    
    self.actionBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0 -44, CGRectGetMaxY(self.titleLable.frame) +40, 88, 36)];
    
    
    [self.actionBtn addTarget:self action:@selector(reloadDataAction) forControlEvents:UIControlEventTouchUpInside];
    [self.actionBtn setTitle:@"重新加载" forState:UIControlStateNormal];
    
    [self.actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    [self addSubview:self.actionBtn];
    
    self.updataBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0 -44, CGRectGetMaxY(self.titleLable.frame) +40, 88, 36)];

    self.updataBtn.hidden = YES;
    [self.updataBtn addTarget:self action:@selector(updataAction) forControlEvents:UIControlEventTouchUpInside];
    [self.updataBtn setTitle:@"版本升级" forState:UIControlStateNormal];
    [self.updataBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self addSubview:self.updataBtn];
    
//    [self.noDataImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.height.width.equalTo(@(172));
//        make.top.equalTo(self).offset(MainScreen.height * 0.5 - 172 - self.upOffset);
//    }];
    
//    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.noDataImg.mas_bottom).offset(24);
//        make.height.equalTo(@(20));
//        make.centerX.equalTo(self);
//    }];
//
//    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleLable.mas_bottom).offset(40);
//        make.height.equalTo(@(36));
//        make.centerX.equalTo(self);
//        make.width.equalTo(@(88));
//    }];
//
//    [self.updataBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleLable.mas_bottom).offset(40);
//        make.height.equalTo(@(36));
//        make.centerX.equalTo(self);
//        make.width.equalTo(@(88));
//    }];
}

-(void)setUpOffset:(CGFloat)upOffset
{
    if (_upOffset == upOffset)
    {
        return;
    }
    _upOffset = upOffset;
    
//    [self.noDataImg mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(MainScreen.height * 0.5 - 172 - upOffset);
//    }];
}

-(void)reloadDataAction
{
    if (self.noDataDelegate && [self.noDataDelegate respondsToSelector:@selector(noDataViewReloadBtnClick)])
    {
        [self.noDataDelegate noDataViewReloadBtnClick];
    }
}
-(void)updataAction
{
//    TDBaseAltView * alt = [[TDBaseAltView alloc] initShowInWindowWithTitle:nil messageStr:@"升级更新需要前往 App Store ,确认前往?" cancleBtnTitle:@"取消" sureBtnTitle:@"前往"];
//    alt.sureBtnClick = ^{
//
//        UIApplication *application = [UIApplication sharedApplication];
//        NSURL *URL = [NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/maoding/id1109343585?mt=8"];
//        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
//            [application openURL:URL options:@{}
//               completionHandler:^(BOOL success) {
//
//               }];
//        } else {
//            //BOOL success = [application openURL:URL];
//
//        }
//    };
}

-(void)setNoDataType:(noDataType)noDataType
{
    _noDataType = noDataType;
    self.updataBtn.hidden = YES;
    self.actionBtn.hidden = YES;
    if (noDataType == noDataTypeNomel)
    {
        self.titleLable.text = @"暂无数据";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_data"];
    }
    else if (noDataType == noDataTypeNoNetWork)
    {
        self.actionBtn.hidden = NO;
        self.titleLable.text = @"请检查您的网络";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_networkanomaly"];
    }
    else if (noDataType == noDataTypeLoadFaild)
    {
        self.actionBtn.hidden = NO;
        self.titleLable.text = @"数据加载失败,请重试";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_failedtoload"];
    }
    else if (noDataType == noDataTypeSearchNoData)
    {
        self.titleLable.text = @"未搜索到相关结果";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_searchresult"];
    }
    else if (noDataType == noDataTypeNoRemiburseListData)
    {
        self.titleLable.text = @"暂无报销";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_reimbursement"];
    }
    else if (noDataType == noDataTypeNoFileListData)
    {
        self.titleLable.text = @"暂无文件";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_file"];
    }
    else if (noDataType == noDataTypeNoMessageListData)
    {
        self.titleLable.text = @"暂无消息";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_message"];
    }
    else if (noDataType == noDataTypeNoSetAmountData)
    {
        self.titleLable.text = @"暂未设置相关金额";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_data"];
    }
    else if (noDataType == noDataTypeNoNotice)//暂无公告
    {
        self.titleLable.text = @"暂无公告";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_data"];
    }
    else if (noDataType == noDataTypeNeedUpdata)
    {
        self.updataBtn.hidden = NO;
        self.titleLable.text = @"当前版本过低,请升级到最新版本";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_update"];
    }
    else if (noDataType == noDataTypeTaskFaild)
    {
        self.titleLable.text = @"当前任务已失效";
        self.noDataImg.image = [UIImage imageNamed:@"defaultpage_pic_failedtoload"];
    }
}

@end
