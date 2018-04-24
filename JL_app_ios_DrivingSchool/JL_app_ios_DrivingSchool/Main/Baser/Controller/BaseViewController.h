//
//  BaseViewController.h
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/23.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

{
    BOOL _isIOS7orLater;
}
@property (readonly) UIView * loadingView;
@property (assign) NSInteger origenY;
//子类可调整originY
- (void)refreshOrigenValue;

/**
 *  屏幕中央的圆形滚动加载
 *
 *  @param bShow 是否显示加载
 */
- (void)showLoading:(BOOL)bShow;
- (void)showEmpty:(BOOL)bShow;
- (void)showError:(BOOL)bShow error:(NSString *)error;

- (void)retryDown:(id)sender;


// 子类实现，不实现则使用默认提示语和占位图
- (UIImage *)imageForEmpty;
- (NSString*)titleForEmpty;
- (NSString*)subtitleForEmpty;

- (UIImage *)imageForError:(NSError *)error;
- (NSString*)titleForError:(NSError*)error;
//- (NSString*)subtitleForError:(NSError *)error;
// 页面状态提示 view 的 frame ，子类通过重写该方法返回适宜的 frame
// 默认返回最佳大小
- (CGRect)frameOfPageStatusView;
//



- (void)getLoadDataBase:(NSNotification *)text;
- (void)hiddleview;
- (void)setNavigationRightBtnImage:(NSString *)imageName;
//添加导航栏右边返回按钮文本
-(void)setNavigationRightBtntitle:(NSString *)titles;
- (void)navigationRightBtnClick;


- (void)setNavigationLeftBtnImage:(NSString *)imageName;
- (void)navigationLeftBtnClick;

@property (copy,nonatomic) NSString *titleViewString;
/**
 * ForcedOutOf 强制退出
 **/
-(void)ForcedOutOf;

/**
 * Noinfonetworks 没有网络
 *-(void)Noinfonetworks;
 **/

/**
 * Yesinfonetworks 有网络
 *-(void)Wifiinfonetworks;
 **/


/**
 * Ginfonetworks 手机移动网
 *-(void)Ginfonetworks;
 **/

/**
 * roundFloat 四拾伍入
 *-(float)roundFloat:(float)price;
 **/

/**
 * 分享传的数据
 **/
- (void)shareWebPageToPlatformType:(NSInteger )platformType URL:(NSString *)url thumImage:(NSString *)image title:(NSString *)title describeString:(NSString *)describe;

@end
