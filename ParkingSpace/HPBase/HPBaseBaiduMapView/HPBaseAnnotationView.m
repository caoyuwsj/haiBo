//
//  HPBaseAnnotationView.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseAnnotationView.h"

@implementation HPBaseAnnotationView

- (instancetype)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

+ (instancetype)annotationViewWithMap:(BMKMapView *)mapView withAnnotation:(id <BMKAnnotation>)annotation {

    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        static NSString *identifier = @"AnnoID";
        // 1.从缓存池中取
        HPBaseAnnotationView *annoView = (HPBaseAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        // 2.如果缓存池中没有, 创建一个新的
        if (annoView == nil) {
            annoView = [[HPBaseAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        if ([annotation isKindOfClass:[HPBaseAnnotationView class]]) {
            annoView.annotation = (HPBaseAnnotationView *)annotation;
        }
        annoView.image = [UIImage imageNamed:@"停车场图标"];
        return annoView;
    }
    return nil;
}

@end
