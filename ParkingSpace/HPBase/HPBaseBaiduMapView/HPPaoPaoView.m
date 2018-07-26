//
//  HPPaoPaoView.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPPaoPaoView.h"
#import "HPBasePoiModel.h"
@interface HPPaoPaoView ()

@property (nonatomic,retain) UIButton *bgButton;
@property (nonatomic,retain) UIImageView *shopImage;
@property (nonatomic,retain) UILabel *nameLab;
//@property (nonatomic,retain) UILabel *areaLab;

@end

@implementation HPPaoPaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;

        _bgButton = [[UIButton alloc] initWithFrame:self.frame];
        [_bgButton addTarget:self action:@selector(clickPaoView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgButton];

        _shopImage = [[UIImageView alloc] initWithFrame:CGRectMake(74, 11, 18, 18)];
        _shopImage.image = [UIImage imageNamed:@"形状36"];
        [self addSubview:_shopImage];

        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(8, 10, 66, 20)];
        _nameLab.font = [UIFont systemFontOfSize:13];
        
        NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"10" attributes:@{NSFontAttributeName:kFontSize(15),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]}];
        NSAttributedString * attr =[[NSAttributedString alloc] initWithString:@"元/小时" attributes:@{NSFontAttributeName:kFontSize(13),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]}];
        [str appendAttributedString:attr];
        
        _nameLab.attributedText = str;
        [self addSubview:_nameLab];

    }
    return self;
}

- (void)setPoi:(HPBasePoiModel *)poi {
    _poi = poi;

//    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:poi.frontImg]];
//    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:poi.frontImg] placeholderImage:[UIImage imageNamed:@"ShopHeadImage"]];
//    self.nameLab.text = poi.name;
//    self.areaLab.text = poi.areaName;
}

- (void)clickPaoView {
    if ([self.delegate respondsToSelector:@selector(paopaoView:coverButtonClickWithPoi:)]) {
        [self.delegate paopaoView:self coverButtonClickWithPoi:self.poi];
    }
}


@end
