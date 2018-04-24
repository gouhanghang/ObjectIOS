//
//  JLNavigationController.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "JLNavigationController.h"

@interface JLNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation JLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    __weak JLNavigationController *weakself=self;
    //    对选择器
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        //        交互式流行手势识别器
        self.interactivePopGestureRecognizer.delegate = weakself;
        self.delegate = weakself;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 跳转方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    
    
    //    //设置导航栏标题颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    //    //设置导航栏颜色
    [self.navigationBar setBarTintColor:[ValidateTool colorWithHex:@"#ffffff"]];
    //    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    if (self.viewControllers.count > 0) {
        // 自动显示和隐藏tabbar  如果进入子控制器不想隐藏，在视图出现的时候将hidesBottomBarWhenPushed设置成NO或者在设置push页面的时候设置成NO
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:YES];
    
}
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController])
    {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
    }
    return self;
}
#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}


//手势识别器应该开始
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if ( gestureRecognizer == self.interactivePopGestureRecognizer )
    {
        if ( self.viewControllers.count < 2  && self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    
    return YES;
}

- (void)pushViewControllerFromBottom:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:NO];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.autoreverses = NO;
    
    
    [self.view.layer addAnimation:transition forKey:kCATransition];
    
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    return [super popToViewController:viewController animated:animated];
    
}

@end
