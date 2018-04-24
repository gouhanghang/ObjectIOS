//
//  HomeController.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
@end

@implementation HomeController
- (NSString *)titleViewString
{return @"主页";}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SpreadTheEarnRequest];
}

-(void)SpreadTheEarnRequest{
    [self showLoading:YES];
    NSString *path = @"";
    NSDictionary *dic=@{@"userid":@"0",
                        @"page":@"1"};
    [HTTPManager postRequestURL:path parameters:dic andProgress:^(double progress) {
    } withSuccessBlock:^(id respondObject) {
        if (respondObject !=nil) {
            //        有数据就消失
            [self showEmpty:NO];
            
        }else{
            //        没有数据的时候暂未
            [self showEmpty:YES];
        }
        NSSLog(@"%@",respondObject);
    } orFailBlock:^(id error) {
      [self showError:YES error:nil];
    }];
    
    
}
#pragma mark - 网络请求数据出错的情况。
-(void)retryDown:(id)sender{
//    [self showError:NO error:nil];
    [self SpreadTheEarnRequest];
    
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
