//
//  PhotoImageView.h
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/11.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finished)(UIImageView *imgView , UIImage* img );

@interface PhotoImageView : UIImageView <UIImagePickerControllerDelegate>

@property (strong,nonatomic) finished finishedBlock;
@end
