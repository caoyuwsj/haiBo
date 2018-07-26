//
//  HPPaoPaoView.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPBasePoiModel, HPPaoPaoView;

@protocol HPPaoPaoViewDelagate <NSObject>

-(void)paopaoView:(HPPaoPaoView *)paopapView coverButtonClickWithPoi:(HPBasePoiModel *)poi;

@end


@interface HPPaoPaoView : UIView
/** poi*/
@property (nonatomic, strong) HPBasePoiModel *poi;

/** ZBPaopaoViewDelagate*/
@property (nonatomic, weak) id<HPPaoPaoViewDelagate> delegate;

@end
