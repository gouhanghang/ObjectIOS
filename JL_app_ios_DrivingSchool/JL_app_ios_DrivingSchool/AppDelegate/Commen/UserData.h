//
//  UserData.h
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//
//－－－－－－－－－－－－－－－－－用户本地数据－－－－－－－－－－－－－－－－－－－－－－－－
#import <Foundation/Foundation.h>

@interface UserData : NSObject

/**
 *用户账号
 */
+(void)saveUserPhone:(NSString *)userPhone;
+ (NSString *)getUserPhone;
/**
 *清楚数据。
 */
+ (void)cleanUserLoginAllMessage;
@end
