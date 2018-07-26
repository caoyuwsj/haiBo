//
//  GXNetWorking.h
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "HPNetWorking.h"

@interface GXNetWorking : HPNetWorking

/*
   get 请求
 */
+(void)getJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(id result))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView ;




+(void)gxPostJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView ;



+(void)gxPostWithUrl:(NSString *)urlString
          mustParameters:(id)mustParameters
                 success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
          viewController:(UIViewController *)vc    ;


+(void)gxPostImgWithUrl:(NSString *)urlString
      mustParameters:(id)mustParameters
                   imgs:(NSArray*)imgArray
              nameArray:(NSArray*)nameArray
             success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
      viewController:(UIViewController *)vc    ;



@end
