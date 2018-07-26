//
//  HPNetWorking.h
//  ParkingSpace
//
//  Created by mac on 2018/7/17.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "FCUUID.h"
#import "UIDevice+FCUUID.h"
#define apiVersion @"v1.0"

typedef enum: NSUInteger
{
    NetworkRequestMethodTypeEditPost  = 0,    //数据提交
    NetworkRequestMethodTypeGetData = 1,       //获取数据需要转圈Loading
    NetworkRequestMethodTypeGetDataNotNeedNodataView = 2, //获取数据不需要无数据遮罩
    NetworkRequestMethodTypeGetDataNoLoadingAnimation = 3,  //获取数据不需要转圈Loading
    NetworkRequestMethodTypeEditPostLoginPart = 4, //登入界面的请求,token失效不需要返回登入界面
    NetworkRequestMethodTypeEditPostNoLoadingAnimation  = 5,    //数据提交不需要转圈
    
}NetworkRequestMethodType;


@interface HPNetWorking : NSObject

/**
 *  带VC和返回跳转判断的标记的网络请求 Post方法
 *  创建：温盛健 2016.12.26
 *  @param urlString     URL
 *  @param mustParameters 必填请求体
 *  @param mustParameters 选填项请求体
 *  @param success    成功返回block
 *  @param fail       失败返回block
 *  @param vc         VC
 *  @param type   请求类型(获取数据与提交数据枚举,错误提示差异)
 *  @param nodataSuperView 无数据页添加的俯视图
 */
+(void)postJSONWithUrl:(NSString *)urlString
               mustParameters:(id)mustParameters
                optionParameters:(id)optionParameters
                  success:(void (^)(id result))success
                     fail:(void (^)(NSError *error))fail
           viewController:(UIViewController *)vc
                ForMethod:(NetworkRequestMethodType) type
 nodataViewAddInSuperView:(UIView *)nodataSuperView ;

/**
 *  上传请求
 *
 *  @param urlStr     上传URL
 *  @param parameters 请求体
 *  @param formData   文件Data数据
 *  @param success    成功回调
 *  @param fail       失败回调
 */
+(NSURLSessionDataTask *)uploadProgressFileOrImageWithURL:(NSString *)urlStr
                                               parameters:(id)parameters
                                                 progress:(void(^)(NSProgress *  uploadProgress))uploadProgress
                                constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))formData
                                                  success:(void (^)(NSURLSessionDataTask *  task, id  responseObject))success
                                                  failure:(void (^)(NSURLSessionDataTask * task, NSError * error))fail;


#pragma mark - 没有任何提示并且没有主IP post
+(void)postNoMainIPJSONWithUrl:(NSString *)string
                       parameters:(id)parameters
                          success:(void (^)(id result))success
                             fail:(void (^)(NSError *error))fail;

 
+(NSString *)fommatTokenWithMustDictionary:(NSDictionary *)mustdic;

/**
 *  带VC和返回跳转判断的标记的网络请求 get方法
 *  创建：温盛健 2016.12.26
 *  @param urlString     URL
 *  @param mustParameters 必填请求体
 *  @param mustParameters 选填项请求体
 *  @param success    成功返回block
 *  @param fail       失败返回block
 *  @param vc         VC
 *  @param type   请求类型(获取数据与提交数据枚举,错误提示差异)
 *  @param nodataSuperView 无数据页添加的俯视图
 */
+(void)getJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(id result))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView ;


+(NSString *)fommatTokenWithMustDictionary:(NSDictionary *)mustdic;
+(NSMutableDictionary *)setSysytemMustKeyValueFor:(NSMutableDictionary *)mustDic;
@end
