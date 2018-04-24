//
//  HTTPManager.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "HTTPManager.h"
static AFHTTPSessionManager *manager;
@implementation HTTPManager

+ (AFHTTPSessionManager *)manager
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer                = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer                 = [AFHTTPRequestSerializer serializer];
        
        manager.requestSerializer.timeoutInterval = 60.0f;
    });
    
    return manager;
    
}

+ (void)postAanGetRequst:(NSDictionary *)parameter
                 withUrl:(NSString *)url
        withSuccessBlock:(SuccessBlock)successObject
             orFailBlock:(FailBlock)failObject{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60.0f;
    
    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSData *data = responseObject;
        successObject(data);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failObject(error);
        
        
    }];
    
}


+(void)postRequestURL:(NSString *)url
           parameters:(id)parameters
          andProgress:(ProgressBlock)progress
     withSuccessBlock:(SuccessBlock)successObject
          orFailBlock:(FailBlock)failObject{
    
    
//    [SVProgressHUD show];
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //这是进度
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        successObject(dic);
        
//        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, id _Nullable error) {
        
         
        
        failObject(error);
//        [SVProgressHUD dismiss];
        
    }];
    
}


+(void)postFileDataWithUrl:(NSString *)url
                parameters:(id)parameters
andconstructingBodyWithBlock:(ConstructingBodyBlock)constructingBodyBlock
               andProgress:(ProgressBlock)progress
          withSuccessBlock:(SuccessBlock)successObject
               orFailBlock:(FailBlock)failObject
            withShowString:(NSString *)showString{
    
    AFHTTPSessionManager *manager             = [AFHTTPSessionManager manager];
    manager.responseSerializer                = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer                 = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0f;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //这里是要上传的数据（图片／视频等数据类）
        constructingBodyBlock(formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //这是进度
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        successObject(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failObject(error);
        
    }];
    
}


@end
