//
//  QLPageStatusView.h
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//



/*!
 @class
 @abstract 页面各种状态显示的view 加载错误显示，结果为空显示 样式包含一张图，主标题，副标题
 */
@interface QLPageStatusView : UIControl


- (void)setImage:(UIImage *)imgIcon title:(NSString *)title subTitle:(NSString *)subTitle;

@end
