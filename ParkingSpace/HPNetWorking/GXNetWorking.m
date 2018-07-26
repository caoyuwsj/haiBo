//
//  GXNetWorking.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "GXNetWorking.h"

@implementation GXNetWorking


+(void)getJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(id result))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView
{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
 
    NSString* linkNet = [NSString new];
    
    
    linkNet = [NSString stringWithFormat:@"%@",urlString];
    
    
    NSMutableDictionary * mustParamterDic = [NSMutableDictionary dictionaryWithDictionary:mustParameters];
    mustParamterDic  = [self setSysytemMustKeyValueFor:mustParamterDic];
 

    [manager GET:linkNet parameters:mustParamterDic progress:^(NSProgress* downloadProgress){
        
    } success:^(NSURLSessionDataTask *task, id responseObject){
        NSLog(@"请求成功---%@", responseObject);
        
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"请求失败---%@", error);
    }];
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


+(void)gxPostJSONWithUrl:(NSString *)urlString
        mustParameters:(id)mustParameters
      optionParameters:(id)optionParameters
               success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
                  fail:(void (^)(NSError *error))fail
        viewController:(UIViewController *)vc
             ForMethod:(NetworkRequestMethodType) type
nodataViewAddInSuperView:(UIView *)nodataSuperView {
    
    [self postJSONWithUrl:urlString mustParameters:mustParameters optionParameters:optionParameters success:^(id resutl){
        
        success([[resutl objectForKey:@"result"] isEqualToString:@"1"]?YES:NO ,  [resutl objectForKey:@"message"] ,[resutl objectForKey:@"code"],[resutl objectForKey:@"data"]);
        
    } fail:fail viewController:vc ForMethod:type nodataViewAddInSuperView:nodataSuperView];
}

+(void)gxPostWithUrl:(NSString *)urlString
      mustParameters:(id)mustParameters
             success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
      viewController:(UIViewController *)vc    {
    
    [self gxPostJSONWithUrl:urlString mustParameters:mustParameters  optionParameters:nil success:success fail:^(NSError* e)
    {
        success(NO,@"网络异常",nil,nil);
    } viewController:vc ForMethod:NetworkRequestMethodTypeGetData nodataViewAddInSuperView:vc.view];
}

+(void)gxPostImgWithUrl:(NSString *)urlString
         mustParameters:(id)mustParameters
                   imgs:(NSArray*)headImage
              nameArray:(NSArray*)nameArray
                success:(void (^)(BOOL isSucceed , NSString* msg , NSString* code , id obj))success
         viewController:(UIViewController *)vc    {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    
    NSMutableDictionary * mustParamterDic = [NSMutableDictionary dictionaryWithDictionary:mustParameters];
    NSMutableDictionary * paramterM = [NSMutableDictionary dictionary];
    [paramterM setDictionary:[self setSysytemMustKeyValueFor:mustParamterDic]];
    NSString *token = [self fommatTokenWithMustDictionary:mustParamterDic];
    [paramterM setObject:token forKey:@"token"];
    
    
    [manager POST:urlString parameters:paramterM constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
        for (int i = 0; i < headImage.count; i++) {
            
            UIImage *image = headImage[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.2);
            
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", nameArray[i]];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:nameArray[i] fileName:fileName mimeType:@"image/jpeg"]; //
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //上传进度
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"progress is %@",uploadProgress);
//        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable resutl) {
        NSLog(@"responseObject = %@",resutl);
        success([[resutl objectForKey:@"result"] isEqualToString:@"1"]?YES:NO ,  [resutl objectForKey:@"message"] ,[resutl objectForKey:@"code"],[resutl objectForKey:@"data"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        ero(error);
        
    }];
    
}

@end
