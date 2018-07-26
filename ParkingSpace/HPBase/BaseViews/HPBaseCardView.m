//
//  HPBaseCardView.m
//  ParkingSpace
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBaseCardView.h"

@implementation HPBaseCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _cardBackView = [[UIView alloc] initWithFrame:self.bounds];
        _cardBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _cardBackView.backgroundColor = [UIColor whiteColor];
        _cardBackView.layer.cornerRadius = 8.0;
        _cardBackView.clipsToBounds = YES;
        [self addSubview:_cardBackView];
        
        self.shadowLayer = (MDCShadowLayer *)self.layer;
        self.shadowLayer.cornerRadius = 8.0;
        self.shadowLayer.elevation = 4.0;
        self.shadowLayer.shadowMaskEnabled = NO;
        
    }
    return self;
}

+ (Class)layerClass {
    return [MDCShadowLayer class];
}

@end
