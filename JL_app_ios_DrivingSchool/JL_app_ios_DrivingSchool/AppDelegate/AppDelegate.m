//
//  AppDelegate.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/23.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self currentVersionVc];
    
    [self.window makeKeyAndVisible];
    //    [NSThread sleepForTimeInterval:2];
    return YES;
}
-(void)currentVersionVc{
    //   用来获取程序的  Info.plist 文件类容的
    NSDictionary *dictplist=[NSBundle mainBundle].infoDictionary;
    //    获取当前版本
    NSString *currentVersion =dictplist[@"CFBundleShortVersionString"];
    //    存放在沙盒 路径 的基本属性
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    // 获取旧版本。。
    NSString *oldviersion=[defaults stringForKey:@"version"];
    //   如果旧版本没有的话，
        if (oldviersion==nil||![currentVersion isEqualToString:oldviersion]) {
            GuidePageController *news               = [[GuidePageController alloc]init];
            JLNavigationController *nav    = [[JLNavigationController alloc]initWithRootViewController:news];
            self.window.rootViewController  = nav;
            [defaults setObject:currentVersion forKey:@"version"];
            [defaults synchronize];
        }
        else{
            JLTabBarController *tabs = [[JLTabBarController alloc]init];
            self.window.rootViewController  = tabs;
        }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
