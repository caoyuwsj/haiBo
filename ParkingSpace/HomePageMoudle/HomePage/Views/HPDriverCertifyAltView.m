//
//  HPDriverCertifyAltView.m
//  ParkingSpace
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPDriverCertifyAltView.h"
@interface HPDriverCertifyAltView ()

@property (nonatomic, strong) UIImageView * alitImageView;
@property (nonatomic, strong) UILabel * alitMessageLabel;

@end
@implementation HPDriverCertifyAltView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.6;
        self.layer.cornerRadius = 20.0;
        self.clipsToBounds = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            if ([self.delegate respondsToSelector:@selector(certifyAltViewAction:)])
            {
                [self.delegate certifyAltViewAction:self];
            }
        }];
        [self addGestureRecognizer:tap];
        
        self.alitImageView = [[UIImageView alloc] init];
        self.alitImageView.image = [UIImage imageNamed:@"警示"];
        [self addSubview:self.alitImageView];
        
        self.alitMessageLabel = [[UILabel alloc] init];
        self.alitMessageLabel.textColor = [UIColor colorWithHexString:@"#FFFFFF"];


        self.alitMessageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.alitMessageLabel];
        [self.alitMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.alitImageView.mas_right).offset(12);
            
        }];
        [self.alitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(24);
            make.height.width.equalTo(@(22));
        }];
        
        
//        您还未进行实名认证，点我快速认证
        
        NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:CustomStr(@"您还未进行实名认证，点我快速认证") attributes:@{NSFontAttributeName:kFontSize(14),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#FFFFFF"]}];

        NSRange matchRange = NSMakeRange(10, 6);
        if (kGetLocalLang && [kGetLocalLang isEqualToString:@"en_US"]) {
            matchRange = NSMakeRange(28, 13);
        }

        
        [attributedString setUnderlineStyle:NSUnderlineStyleSingle range:matchRange];
        [attributedString setTextHighlightRange:matchRange color:[UIColor redColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            
            
        }];
        self.alitMessageLabel.attributedText = attributedString;
        self.alitMessageLabel.adjustsFontSizeToFitWidth = YES;
        
    }
    return self;
}
-(void)localLanguageChangedToRefreshUI
{

    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:CustomStr(@"您还未进行实名认证，点我快速认证") attributes:@{NSFontAttributeName:kFontSize(14),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#FFFFFF"]}];

    NSRange matchRange = NSMakeRange(10, 6);
    if (kGetLocalLang && [kGetLocalLang isEqualToString:@"en_US"]) {
        matchRange = NSMakeRange(28, 13);
    }


    [attributedString setUnderlineStyle:NSUnderlineStyleSingle range:matchRange];
    [attributedString setTextHighlightRange:matchRange color:[UIColor redColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {

    }];
    self.alitMessageLabel.attributedText = attributedString;
    self.alitMessageLabel.adjustsFontSizeToFitWidth = YES;

}

@end
