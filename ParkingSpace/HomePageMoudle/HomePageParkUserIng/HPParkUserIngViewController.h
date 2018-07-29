//
//  HPParkUserIngViewController.h
//  ParkingSpace
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPBaseAltActionViewController.h"

@class HPParkUserIngViewController;

@protocol HPParkUserIngViewControllerDelegate <NSObject>

@optional
- (void)HPParkUserIngViewController:(HPParkUserIngViewController *)viewController panchDownAction:(UIButton *)sender;
- (void)HPParkUserIngViewController:(HPParkUserIngViewController *)viewController finishedUseBtnAction:(UIButton *)sender;
@end


@interface HPParkUserIngViewController : HPBaseAltActionViewController

@property (nonatomic, weak) id <HPParkUserIngViewControllerDelegate> delegate;

@end
