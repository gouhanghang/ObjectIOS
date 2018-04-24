//
//  TabBarView.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "TabBarView.h"

#import "TabBarButton.h"
@interface TabBarView()

@property (strong,nonatomic) TabBarButton *selectButton;

@end
@implementation TabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)addTabButtonWithItem:(UITabBarItem *)item
{
    
    TabBarButton *button = [[TabBarButton alloc]init];
    //    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:button];
    //2.设置数据
    button.item = item;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
   
    
}

//【注】项目弹出框点击弹出提示
- (void)buttonClick:(TabBarButton *)button
{
    
    
    //1.通知代理
    if ([self.delegat respondsToSelector:@selector(taBar:didSelectButtonFrom:from:)]) {
        [self.delegat taBar:self didSelectButtonFrom:self.selectButton.tag from:button.tag];
    }
    
    //2.确定按钮状态
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i<self.subviews.count; i++) {
        TabBarButton *button = self.subviews[i];
//        button.backgroundColor=Kwhite;//[UIColor yellowColor];
        CGFloat y =SCREEN_HEIGHT == 812.0?5:0;
        CGFloat w = self.frame.size.width/self.subviews.count;
        CGFloat h = SCREEN_HEIGHT == 812.0?self.frame.size.height-30:self.frame.size.height;
        CGFloat x = i * w;
        button.tag = i;
        button.frame = CGRectMake(x, y, w, h);
    }
}
@end
