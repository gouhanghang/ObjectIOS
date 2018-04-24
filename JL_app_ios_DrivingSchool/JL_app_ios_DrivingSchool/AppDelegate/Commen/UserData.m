//
//  UserData.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "UserData.h"

@implementation UserData
+ (void)saveUserPhone:(NSString *)userPhone
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userPhone forKey:@"userPhone"];
    [userDefaults synchronize];
    
}
+ (NSString *)getUserPhone
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userPhone = [userDefaults objectForKey:@"userPhone"];
    return userPhone;
}

+ (void)cleanUserLoginAllMessage
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userPhone"];
    //网络图片清理
    [[[SDWebImageManager sharedManager] imageCache] clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] clearMemory];
}
@end
