//
//  JLTabBarController.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "TabBarView.h"
#import "TabBarButton.h"
#import "JLTabBarController.h"

@interface JLTabBarController ()<tabBarViewDelegate>
@property (weak,nonatomic) TabBarView *customTab;
@property(nonatomic ,assign)NSInteger formIndex;

@end

@implementation JLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self setTab];
    [self creatTabBarSubViews];
}

- (void)creatTabBarSubViews
{
    HomeController *home = [HomeController new];
    [self setupChildViewController:home title:@"首页" imageName:@"home_gray" selectedImageName:@"home_blue"];
    
    UserController *user = [UserController new];
    [self setupChildViewController:user title:@"个人中心" imageName:@"mine_gray" selectedImageName:@"main_blue"];
}
- (void)setTab
{
    TabBarView *customTab = [[TabBarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT == 812.0?80:49)];
    customTab.backgroundColor=Kwhite;
    customTab.delegat = self;
    //    customTab.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTab];
    self.customTab = customTab;
    
}

- (void)taBar:(TabBarView *)taBar didSelectButtonFrom:(NSInteger)from from:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    
    childVc.title = title;
    childVc.tabBarItem.image = JLImage(imageName);
    childVc.tabBarItem.selectedImage =JLImage(selectedImageName);
    JLNavigationController *nav = [[JLNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    //3.1
    [self.customTab addTabButtonWithItem:childVc.tabBarItem];
    
    
    
    
}

- (void)viewDidLayoutSubviews
{
    for (UIView *btnView in self.tabBar.subviews) {
        if ([btnView isKindOfClass:[UIControl class]]) {
            [btnView removeFromSuperview];
        }
    }
    [super viewDidLayoutSubviews];
    
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    [super setSelectedIndex:selectedIndex];
    
    
    TabBarButton *batButton = self.customTab.subviews[self.formIndex];
    batButton.selected = NO;
    
    TabBarButton *baButton = self.customTab.subviews[selectedIndex];
    baButton.selected = YES;
    self.formIndex = selectedIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
