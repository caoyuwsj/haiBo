//
//  HPParkUserIngViewController.m
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPParkUserIngViewController.h"
#import "HPParkUseringMessageMoudleView.h"

@interface HPParkUserIngViewController ()

@property (nonatomic, strong) HPBaseCardView * yellCardView;
@property (nonatomic, strong) UIImageView * downImage;

@property (nonatomic, strong) UILabel  * parkingTitleLabel;
@property (nonatomic, strong) UILabel  * parkingTimeLabel;
@property (nonatomic, strong) UILabel  * parkingCostLabel;

@property (nonatomic, strong) UILabel  * parkingFreeCostTitleLabel;
@property (nonatomic, strong) UILabel  * parkingFreeCostLabel;
@property (nonatomic, strong) UILabel  * parkingLastCostTtleLabel;
@property (nonatomic, strong) UILabel  * parkingLastCostLabel;

@property (nonatomic, strong) HPParkUseringMessageMoudleView * timeMoudleView;
@property (nonatomic, strong) HPParkUseringMessageMoudleView * parkNumberView;
@property (nonatomic, strong) HPParkUseringMessageMoudleView * carNumberView;


@property (nonatomic, strong) UIView * line1;
@property (nonatomic, strong) UIView * line2;
@property (nonatomic, strong) UIView * line3;

@end

@implementation HPParkUserIngViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topTitleLabel.text = @"恒丰财富港大厦停车场";
    self.cardView.cardBackView.layer.cornerRadius = 30.0;
    self.cardView.shadowLayer.cornerRadius = 30.0;
    self.bottomMiddleBtn.hidden = YES;
    
    self.yellCardView = [[HPBaseCardView alloc] initWithFrame:CGRectZero];
    self.yellCardView.cardBackView.backgroundColor = [UIColor colorWithHexString:@"#FAC02D"];
    self.yellCardView.cardBackView.layer.cornerRadius = 4.0;
    self.yellCardView.shadowLayer.cornerRadius = 4.0;
    [self.cardView addSubview:self.yellCardView];
    
    self.parkingTitleLabel = [UILabel new];
    self.parkingTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.parkingTitleLabel.font = kFontSize(13);
    self.parkingTitleLabel.textColor = [UIColor colorWithHexString:@"#A28724"];
    self.parkingTitleLabel.text = @"停车计时中";
    [self.yellCardView  addSubview:self.parkingTitleLabel];
    
    self.parkingTimeLabel = [UILabel new];
    self.parkingTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.parkingTimeLabel.font = kFontSize(36);
    self.parkingTimeLabel.textColor = [UIColor colorWithHexString:@"#3D2E06"];
    self.parkingTimeLabel.text = @"01:12:01";
    [self.yellCardView  addSubview:self.parkingTimeLabel];
    
    self.parkingCostLabel = [UILabel new];
    self.parkingCostLabel.textAlignment = NSTextAlignmentCenter;
    self.parkingCostLabel.font = kFontSize(13);
    self.parkingCostLabel.textColor = [UIColor colorWithHexString:@"#A28724"];
    self.parkingCostLabel.text = @"您当前的停车费用为20元";
    [self.yellCardView  addSubview:self.parkingCostLabel];
    
    self.parkingFreeCostTitleLabel = [UILabel new];
    self.parkingFreeCostTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.parkingFreeCostTitleLabel.font = kFontSize(15);
    self.parkingFreeCostTitleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.parkingFreeCostTitleLabel.text = @"已免费停车时长";
    [self.cardView  addSubview:self.parkingFreeCostTitleLabel];
    
    self.parkingFreeCostLabel = [UILabel new];
    self.parkingFreeCostLabel.textAlignment = NSTextAlignmentRight;
    self.parkingFreeCostLabel.font = kFontSize(15);
    self.parkingFreeCostLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.parkingFreeCostLabel.text = @"30分钟";
    [self.cardView  addSubview:self.parkingFreeCostLabel];
    
    self.parkingLastCostTtleLabel = [UILabel new];
    self.parkingLastCostTtleLabel.textAlignment = NSTextAlignmentLeft;
    self.parkingLastCostTtleLabel.font = kFontSize(15);
    self.parkingLastCostTtleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.parkingLastCostTtleLabel.text = @"您当前所剩余额为";
    [self.cardView  addSubview:self.parkingLastCostTtleLabel];
    
    self.parkingLastCostLabel = [UILabel new];
    self.parkingLastCostLabel.textAlignment = NSTextAlignmentRight;
    self.parkingLastCostLabel.font = kFontSize(15);
    self.parkingLastCostLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.parkingLastCostLabel.text = @"100元";
    [self.cardView  addSubview:self.parkingLastCostLabel];
    
    [self.topLefttBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self.topLefttBtn setImage:nil forState:UIControlStateNormal];
    
    [self.topRightBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self.topRightBtn setImage:nil forState:UIControlStateNormal];
    
    [self.topLefttBtn setTitle:@"充值" forState:UIControlStateNormal];
    [self.topRightBtn setTitle:@"结束用车" forState:UIControlStateNormal];
    self.topLefttBtn.backgroundColor = [UIColor colorWithHexString:@"#FAC02D"];
    self.topRightBtn.backgroundColor = [UIColor colorWithHexString:@"#FF4D4A"];
    self.topLefttBtn.layer.cornerRadius = 20.0;
    self.topRightBtn.layer.cornerRadius = 20.0;
    self.topLefttBtn.clipsToBounds = YES;
    self.topRightBtn.clipsToBounds = YES;
    
    self.timeMoudleView = [[HPParkUseringMessageMoudleView alloc] init];
    [self.cardView addSubview:self.timeMoudleView];
    self.timeMoudleView.titleLabel.text = @"开始时间";
    self.timeMoudleView.contentLabel.text = @"12:06:08";
    self.timeMoudleView.iconImage.image = [UIImage imageNamed:@"开始时间"];
    
    self.parkNumberView = [[HPParkUseringMessageMoudleView alloc] init];
    [self.cardView addSubview:self.parkNumberView];
    self.parkNumberView.titleLabel.text = @"泊位编号";
    self.parkNumberView.contentLabel.text = @"1206080";
    self.parkNumberView.iconImage.image = [UIImage imageNamed:@"泊位编号"];
    
    self.carNumberView = [[HPParkUseringMessageMoudleView alloc] init];
    [self.cardView addSubview:self.carNumberView];
    self.carNumberView.titleLabel.text = @"车牌号";
    self.carNumberView.contentLabel.text = @"1206080";
    self.carNumberView.iconImage.image = [UIImage imageNamed:@"车牌号"];
    
    
    self.line1 = [UIView new];
    self.line1.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [self.cardView addSubview:self.line1];
    self.line2 = [UIView new];
    self.line2.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [self.cardView addSubview:self.line2];
    
    self.line3 = [UIView new];
    self.line3.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [self.cardView addSubview:self.line3];
    
    [self.yellCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topTitleLabel.mas_bottom).offset(24);
        make.left.equalTo(self.cardView).offset(30);
        make.right.equalTo(self.cardView).offset(-30);
        make.height.equalTo(@(150));
    }];
    
    [self.timeMoudleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yellCardView);
        make.top.equalTo(self.yellCardView.mas_bottom).offset(30);
        make.width.equalTo(@((SCREEN_WIDTH -60 - 40)/3.0));
        make.height.equalTo(@(44));
    }];
    
    [self.parkNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.yellCardView);
        make.top.equalTo(self.yellCardView.mas_bottom).offset(30);
        make.width.equalTo(@((SCREEN_WIDTH -60 - 40)/3.0));
        make.height.equalTo(@(44));
    }];
    
    [self.carNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.yellCardView);
        make.top.equalTo(self.yellCardView.mas_bottom).offset(30);
        make.width.equalTo(@((SCREEN_WIDTH -60 - 40)/3.0));
        make.height.equalTo(@(44));
    }];
    
    
    [self.parkingTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yellCardView.mas_top).offset(20);
        make.centerX.equalTo(self.yellCardView);
        
    }];
    
    [self.parkingTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.parkingTitleLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.yellCardView);
        
    }];
    
    [self.parkingCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.parkingTimeLabel.mas_bottom).offset(16);
        make.centerX.equalTo(self.yellCardView);
        
    }];
    //
    [self.parkingLastCostTtleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.topLefttBtn.mas_top).offset(-30);
        make.left.equalTo(self.yellCardView);
    }];
    
    [self.parkingLastCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.parkingLastCostTtleLabel);
        make.right.equalTo(self.yellCardView);
        
    }];
    
    [self.parkingFreeCostTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.parkingLastCostTtleLabel.mas_top).offset(-16);
        make.left.equalTo(self.yellCardView);
        
    }];
    
    [self.parkingFreeCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.parkingFreeCostTitleLabel);
        make.right.equalTo(self.yellCardView);
        
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(1.5));
        make.centerX.equalTo(self.cardView.mas_left).offset(SCREEN_WIDTH/3.0 - 0.75);
        make.height.equalTo(@(44));
        make.centerY.equalTo(self.timeMoudleView);
    }];
    
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(1.5));
        make.centerX.equalTo(self.cardView.mas_right).offset(-(SCREEN_WIDTH/3.0 - 0.75));
        make.height.equalTo(@(44));
        make.centerY.equalTo(self.timeMoudleView);
    }];
    
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1.5));
        make.bottom.equalTo(self.topLefttBtn.mas_top).offset(-14.25);
        make.width.equalTo(self.cardView);
    }];
    
    
}

-(void)addCardViewContains
{
    if (self.cardView)
    {
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(30);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.equalTo(@(500));
        }];
    }
}

-(void)addTopLeftBtnContains
{
    [self.topLefttBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardView).offset(-30 - 20);
        make.height.equalTo(@(40));
        make.width.equalTo(@(100));
        make.centerX.equalTo(self.cardView).offset(-SCREEN_WIDTH/4.0);
    }];
}

-(void)addTopRightBtnContains
{
    [self.topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardView).offset(-30 - 20);
        make.height.equalTo(@(40));
        make.width.equalTo(@(100));
        make.centerX.equalTo(self.cardView).offset(SCREEN_WIDTH/4.0);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
