//
//  PhotoImageView.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/11.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "PhotoImageView.h"

@implementation PhotoImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    self.userInteractionEnabled = YES;
    [self bk_whenTapped:^{
        [self setPhoto];
    }];
}

-(void)setPhoto{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIActionSheet *action = [[UIActionSheet alloc] bk_initWithTitle:@"设置头像"];
    [action bk_addButtonWithTitle:@"拍照" handler:^{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
            [self.getCurrentVC presentViewController:imagePicker animated:YES completion:nil];
        }
        else{
//            [self.getCurrentVC.view makeToast:@"该设备没有摄像头" duration:2.0f position:@"center"];
            return;
        }
        
    }];
    [action bk_addButtonWithTitle:@"相册" handler:^{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
            imagePicker.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
            [self.getCurrentVC presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
 
    [action bk_setCancelButtonWithTitle:@"取消" handler:^{
        NSLog(@"取消");
    }];
    
    [action showInView:self.getCurrentVC.view];
}
- (UIViewController *)getCurrentVC
{
    // 定义一个变量存放当前屏幕显示的viewcontroller
    UIViewController *result = nil;
    
    // 得到当前应用程序的主要窗口
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    // windowLevel是在 Z轴 方向上的窗口位置，默认值为UIWindowLevelNormal
    if (window.windowLevel != UIWindowLevelNormal)
    {
        // 获取应用程序所有的窗口
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            // 找到程序的默认窗口（正在显示的窗口）
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                // 将关键窗口赋值为默认窗口
                window = tmpWin;
                break;
            }
        }
    }
    
    // 获取窗口的当前显示视图
    UIView *frontView = [[window subviews] objectAtIndex:0];
    
    // 获取视图的下一个响应者，UIView视图调用这个方法的返回值为UIViewController或它的父视图
    id nextResponder = [frontView nextResponder];
    
    // 判断显示视图的下一个响应者是否为一个UIViewController的类对象
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"cancel");
    [self.getCurrentVC dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    NSLog(@"照片信息--%@", info);
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.getCurrentVC dismissViewControllerAnimated:YES completion:nil];
    
//    CGSize imagesize = image.size;
    
    NSData *data = UIImageJPEGRepresentation(image, 0.1);
    UIImage *resultImage = [UIImage imageWithData:data];
    
    self.finishedBlock(self,image);
//    NSData *imageData = UIImageJPEGRepresentation([self imageWithImage:image scaledToSize:imagesize], 0.1);
    
 
}
@end
