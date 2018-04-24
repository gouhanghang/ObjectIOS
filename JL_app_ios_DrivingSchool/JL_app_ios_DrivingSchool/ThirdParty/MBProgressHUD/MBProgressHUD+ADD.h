

//#import "MBProgressHUD/MBProgressHUD.h"

@interface MBProgressHUD (ADD)

/**
 *  信息提示
 *  @param information 提示文字
 *  @param view        HUD展示的view
 *  @param afterDelay  展示的时间
 */
+ (MBProgressHUD *)showInformation:(NSString *)information toView:(UIView *)view andAfterDelay:(float)afterDelay;

+ (MBProgressHUD *)showInformationCenter:(NSString *)information toView:(UIView *)view andAfterDelay:(float)afterDelay;
/**
 *  自定义view
 *  @param customview 自定义的view
 *  @param textString 提示文字
 *  @param view       HUD展示的view
 *  @param afterDelay 展示时间
 */
+ (void)showCustomview:(UIView *)customview andTextString:(NSString *)textString toView:(UIView *)view andAfterDelay:(float)afterDelay;

@end
