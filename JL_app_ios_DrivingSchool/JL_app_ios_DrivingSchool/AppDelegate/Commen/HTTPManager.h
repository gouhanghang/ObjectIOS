//
//  HTTPManager.h
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.


//  －－－－－－－－－－－－－－－－－对网络请求的封装－－－－－－－－－－－－－－－－－－

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id respondObject);

typedef void (^FailBlock)(id error);

typedef void (^ProgressBlock)(double progress);

typedef void (^ConstructingBodyBlock)(id<AFMultipartFormData> formData);

typedef void (^isNetBlock)(id status);


@interface HTTPManager : NSObject


/*
 ***普通的 POST 请求 无文件上传的post
 ***url             接口地址
 ***parameters      参数
 ***progress        上传数据进度 0--1之间
 ***successObject   成功回调
 ***failObject      失败回调
 */
+(void)postRequestURL:(NSString *)url
           parameters:(id)parameters
          andProgress:(ProgressBlock)progress
     withSuccessBlock:(SuccessBlock)successObject
          orFailBlock:(FailBlock)failObject;


+ (void)postAanGetRequst:(NSDictionary *)parameter
                 withUrl:(NSString *)url
        withSuccessBlock:(SuccessBlock)successObject
             orFailBlock:(FailBlock)failObject;

@end
