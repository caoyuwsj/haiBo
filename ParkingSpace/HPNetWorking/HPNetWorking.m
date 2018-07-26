//
//  HPNetWorking.m
//  ParkingSpace
//
//  Created by mac on 2018/7/17.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//  对AF进行二次封装

#import "HPNetWorking.h"

@implementation HPNetWorking
+(void)postJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(id result))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView
{
    //设置请求转圈样式
    if (nodataSuperView)
    {
        //获取数据
        if (type == NetworkRequestMethodTypeGetData)
        {
//            [nodataSuperView loadingBeginAnimationIsPost:NO];
        }
        //提交数据
        else if(type == NetworkRequestMethodTypeEditPost)
        {
//            [nodataSuperView loadingBeginAnimationIsPost:YES];
        }
        //登入
        else if(type == NetworkRequestMethodTypeEditPostLoginPart)
        {
//            [nodataSuperView loadingBeginAnimationIsPost:YES];
        }
        else
        {
            
        }
    }
    //设置提示错误或者成功小黑框显示父视图,设置无数据页面的代理 点击重新请求时发起重新请求方法

    //网络状态良好才发起请求
//    if (help.netWorksGood)
    {
        //状态栏网络请求转圈指示
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        });

        if (nodataSuperView)
        {
            [MBProgressHUD showHUDAddedTo:nodataSuperView animated:YES];
        }

        AFHTTPSessionManager* _SessionManager=[AFHTTPSessionManager manager];
        _SessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        //设置请求超时
        [_SessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _SessionManager.requestSerializer.timeoutInterval = 10.0;
        [_SessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

        //必填项
        NSMutableDictionary * mustParamterDic = [NSMutableDictionary dictionaryWithDictionary:mustParameters];
        //选填项
        NSMutableDictionary * optionDic = [NSMutableDictionary dictionaryWithDictionary:optionParameters];
        

        mustParamterDic  = [self setSysytemMustKeyValueFor:mustParamterDic];
        
        NSMutableDictionary * paramterM = [NSMutableDictionary dictionary];

        [paramterM setDictionary:optionDic];
        [paramterM setDictionary:mustParamterDic];

        //must生成token
        NSString *token = [self fommatTokenWithMustDictionary:mustParamterDic];

        [paramterM setObject:token forKey:@"token"];

        __weak typeof(self)weakSelf = self;
        [_SessionManager POST:urlString parameters:paramterM progress:^(NSProgress * _Nonnull uploadProgress) {
            
        }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             [MBProgressHUD hideHUDForView:nodataSuperView animated:YES];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

             });
             NSLog(@"responseObject = %@",responseObject);
             //抛出结果
             if (!responseObject || ![[responseObject objectForKey:@"result"] isEqualToString:@"0"])
             {
                 
                 
             }
             //正常结果处理，也可以不进行处理
             else
             {
//                 success(responseObject);
             }
             //结果正不正常都抛出结果方便外部再次进行处理
             success(responseObject);
             
         }
                          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {

             if (error)
             {
                 fail(error);
             }

             [MBProgressHUD hideHUDForView:nodataSuperView animated:YES];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
             });
             
         }];
    }
    //网络状态不好并且界面还没有数据，相应的类型进无网络覆盖
//    else if (!help.netWorksGood && nodataSuperView.isFirstRequest)
    return;
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        //判断无数据的父视图有则可以覆盖，没有则弹小黑框
        if (nodataSuperView)
        {

        }

        fail([[NSError alloc] init]);
    }
    //网络不好，并且界面已有数据，则只弹小黑框
//    else
    {

        fail([[NSError alloc] init]);
    }

}

/**
 *  上传请求
 *
 *  @param urlStr     上传URL
 *  @param parameters 请求体
 *  @param formData   文件Data数据
 *  @param success    成功回调
 *  @param fail       失败回调
 */
+(NSURLSessionDataTask *)uploadProgressFileOrImageWithURL:(NSString *)urlStr parameters:(id)parameters progress:(void(^)(NSProgress *  uploadProgress))progress constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))formData success:(void (^)(NSURLSessionDataTask *  task, id  responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))fail
{
//    AppDelegate *app = kApp ;
//    TDUserDataHelp * help = [TDUserDataHelp shareHelp];
    //网络状态判断
//    if (help.netWorksGood)
    {
        //状态栏网络请求转圈指示
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        NSMutableDictionary *paramterM = [NSMutableDictionary dictionaryWithDictionary:parameters];
        
//        NSString *fcUUID = [FCUUID uuidForDevice];
//


        AFHTTPSessionManager* _SessionManager=[AFHTTPSessionManager manager];
        _SessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        //设置请求超时
        [_SessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _SessionManager.requestSerializer.timeoutInterval = 10.0;
        [_SessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        NSURLSessionDataTask * task = [_SessionManager POST:urlStr parameters:paramterM
                                      constructingBodyWithBlock:formData
                                                       progress:^(NSProgress * _Nonnull uploadProgress)
                                       {
                                           progress(uploadProgress);
                                       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
                                       {
                                           success(task,responseObject);
                                           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                           
                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           
                                           if (error)
                                           {
                                               fail(task,error);
                                               NSString * errDic = error.localizedDescription;
                                               
                                           }
                                           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                       }];
        return task;
    }
    return nil;
//    else
//    {
//        [TDPromptView creatPromptViewWithOnlyTextMessage:@"网络不给力" inView:app.window];
//        fail(nil,nil);
//        return nil;
//    }
}

#pragma mark - 没有任何提示并且没有主IP
+(void)postNoMainIPJSONWithUrl:(NSString *)string
                    parameters:(id)parameters
                       success:(void (^)(id result))success
                          fail:(void (^)(NSError *error))fail
{
//    TDUserDataHelp * help = [TDUserDataHelp shareHelp];
//    if (help.netWorksGood)
    {
        //状态栏网络请求转圈指示
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        NSMutableDictionary *paramterM = [NSMutableDictionary dictionaryWithDictionary:parameters];
        AFHTTPSessionManager* _SessionManager=[AFHTTPSessionManager manager];
        _SessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        //设置请求超时
        [_SessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _SessionManager.requestSerializer.timeoutInterval = 10.0;
        [_SessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        [_SessionManager POST:string parameters:paramterM progress:^(NSProgress * _Nonnull uploadProgress)
         {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             if (success)
             {
                 success(responseObject);
             }
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             if (fail)
             {
                 fail(error);
             }
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
         }];
    }
//    else
    {
        
    }
}

+(NSString *)getCurrentTemptime
{
    NSDate * currentTime = [NSDate date];
    NSTimeInterval  currentTimeInterval = currentTime.timeIntervalSince1970;
    if(currentTimeInterval > 140000000000) {
        currentTimeInterval = currentTimeInterval / 1000;
    }
    return [NSString stringWithFormat:@"%f",currentTimeInterval];
}

//token生成器规则：md5(去掉非必填且空值的接口参数（按参数名升序排序） + userkey), userkey为登录后个人key
+(NSString *)fommatTokenWithMustDictionary:(NSDictionary *)mustdic
{
    NSArray * keyArray = mustdic.allKeys;
    //key 排序
    NSSortDescriptor * descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:descriptor];
    NSArray * sortKeyAll = [keyArray sortedArrayUsingDescriptors:descriptors];

    NSMutableString * token = [NSMutableString stringWithString:@""];

    for (NSInteger i = 0; i < sortKeyAll.count; i++)
    {
        NSString * key = sortKeyAll[i];
        NSString * value = [mustdic objectForKey:key];
        NSString * obj = @"";
        if (value && value.length > 0)
        {
             obj = [NSString stringWithFormat:@"%@=%@",key,value];
        }
        //有值
        if (obj.length > 0 )
        {

            [token appendString:obj];
        }
        //最后的不加&符号
        if ( i != sortKeyAll.count - 1) {
            [token appendString:@"&"];
        }
    }
//    if(![USER.userkey isBlankString])
    if(USER.userkey.length>1)
    {
        [token appendString:USER.userkey];
    }
    NSLog(@"tokenstr = %@",token);
    NSString * md5Token = [token md5String];
    NSLog(@"md5Token = %@",md5Token);
    return md5Token;

}

/**
 设置系统必填字段

 @param mustDic 必填字段
 @return 加入系统性必填字段的MustDic
 */
+(NSMutableDictionary *)setSysytemMustKeyValueFor:(NSMutableDictionary *)mustDic
{
    
    //当前时间
    NSString * Temptime =  [self getCurrentTemptime];
    [mustDic setObject:[Temptime substringToIndex:10] forKey:@"temptime"];
    //接口版本
    [mustDic setObject:apiVersion forKey:@"apiversions"];
    //语言
    if (kGetLocalLang && [kGetLocalLang length] > 0)
    {
        [mustDic setObject:kGetLocalLang forKey:@"lang"];
    }
    else
    {
        [mustDic setObject:@"zh_CN" forKey:@"lang"];
    }
    //设备识别
    NSString *fcUUID = [FCUUID uuidForDevice];
    if (fcUUID && fcUUID.length > 0)
    {
        [mustDic setObject:fcUUID forKey:@"key"];
    }
    return mustDic;
    
}

+(void)getJSONWithUrl:(NSString *)urlString
       mustParameters:(id)mustParameters
     optionParameters:(id)optionParameters
              success:(void (^)(id result))success
                 fail:(void (^)(NSError *error))fail
       viewController:(UIViewController *)vc
            ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView
{
    //状态栏网络请求转圈指示
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    
    
    AFHTTPSessionManager* _SessionManager=[AFHTTPSessionManager manager];
    _SessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    //设置请求超时
    [_SessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _SessionManager.requestSerializer.timeoutInterval = 10.0;
    [_SessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //必填项
    NSMutableDictionary * mustParamterDic = [NSMutableDictionary dictionaryWithDictionary:mustParameters];
    //选填项
    NSMutableDictionary * optionDic = [NSMutableDictionary dictionaryWithDictionary:optionParameters];
    
    
    mustParamterDic  = [self setSysytemMustKeyValueFor:mustParamterDic];
    
    NSMutableDictionary * paramterM = [NSMutableDictionary dictionary];
    
    [paramterM setDictionary:optionDic];
    [paramterM setDictionary:mustParamterDic];
    
    
    //must生成token
    NSString *token = [self fommatTokenWithMustDictionary:mustParamterDic];
    
    [paramterM setObject:token forKey:@"token"];
    
    __weak typeof(self)weakSelf = self;
    
    [_SessionManager GET:urlString parameters:paramterM progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        });
        //抛出结果
        if (!responseObject || ![[responseObject objectForKey:@"result"] isEqualToString:@"0"])
        {
            
            
        }
        //正常结果处理，也可以不进行处理
        else
        {
            
        }
        //结果正不正常都抛出结果方便外部再次进行处理
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error)
        {
            fail(error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    }];
    
}


@end
