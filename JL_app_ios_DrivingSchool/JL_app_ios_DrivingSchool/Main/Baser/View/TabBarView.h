//
//  TabBarView.h
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import <UIKit/UIKit.h>
@class TabBarView;
@protocol tabBarViewDelegate <NSObject>

@optional
- (void)taBar:(TabBarView *)taBar didSelectButtonFrom:(NSInteger)from from:(NSInteger)to;

@end
@interface TabBarView : UIView


- (void)addTabButtonWithItem:(UITabBarItem *)item;
@property (weak,nonatomic) id<tabBarViewDelegate> delegat;
@end
