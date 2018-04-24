//
//  BaseViewController.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/23.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "BaseViewController.h"
#import "QLPageStatusView.h"  // 数据展位view
@interface BaseViewController ()
{
    QLPageStatusView * _pStatusView;
    FLAnimatedImageView * _statusLoadingView;
    NSString  *_string;
    UIView *_allview;
}

@property (strong,nonatomic) UIButton *rightItemBtn;
@property (strong,nonatomic) UIButton *leftItemBtn;
@end
@implementation BaseViewController
@synthesize loadingView = _loadingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isIOS7orLater = [UIDevice isIOS7OrLatter];
        _statusLoadingView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0,100,100)];
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self LoadDateNewtwork];
}
#pragma mark  -判断 系统需要强制更新的时候。
-(void)LoadDateNewtwork{
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO]; //隐藏导航栏、做的是自定义导航栏
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO]; //隐藏导航栏、做的是自定义导航栏
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = Kwhite;
    [self loadViewUI];
}

-(void)loadViewUI{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SafeAreaTopHeight)];
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, view.height)];
    image.backgroundColor=AllbackColor;
    [view addSubview:image];
    _allview=view;
    UILabel *titlelabe=[UILabel new];
    titlelabe.text=self.titleViewString;
    titlelabe.font=JLFont(15);
    titlelabe.textAlignment=NSTextAlignmentCenter;
    titlelabe.textColor=Kwhite;
    [view addSubview:titlelabe];
    [titlelabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view.mas_centerX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(view.mas_height);
        make.top.mas_equalTo(SCREEN_HEIGHT == 812.0?20:10);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(navigationLeftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    _leftItemBtn=backBtn;
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *messbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [messbtn addTarget:self action:@selector(navigationRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:messbtn];
    _rightItemBtn=messbtn;
    [messbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
    }];
    [self.view addSubview:view];
    
}
#pragma mark - 隐藏的view
- (void)hiddleview{
    _allview.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -添加导航栏右边返回按钮文本
-(void)setNavigationRightBtntitle:(NSString *)titles
{
    [self.rightItemBtn setTitle:titles forState:UIControlStateNormal];
    [self.rightItemBtn setTitleColor:Kwhite forState:UIControlStateNormal];
    self.rightItemBtn.titleLabel.font=JLFont(12);
    self.rightItemBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
}
#pragma mark -添加导航栏左边边返回按钮图片
- (void)setNavigationLeftBtnImage:(NSString *)imageName
{
    [self.leftItemBtn setImage:JLImage(imageName) forState:UIControlStateNormal];
}
#pragma mark -添加导航栏右边返回按钮图片
- (void)setNavigationRightBtnImage:(NSString *)imageName
{
    [self.rightItemBtn setImage:JLImage(imageName) forState:UIControlStateNormal];
}
#pragma mark -右边按钮Action
- (void)navigationRightBtnClick
{}
#pragma mark -左边按钮Action
- (void)navigationLeftBtnClick
{}
#pragma  mark -身份过期的时候调用
-(void)ForcedOutOf{}
#pragma mark - 后期做分享调用[友盟分享]。
- (void)shareWebPageToPlatformType:(NSInteger )platformType URL:(NSString *)url thumImage:(NSString *)image title:(NSString *)title describeString:(NSString *)describe{}

#pragma mark -【====项目占位图====】
- (QLPageStatusView *)pStatusView {
    if ( !_pStatusView ) {
        _pStatusView = [[QLPageStatusView alloc] init];
        _pStatusView.backgroundColor = [UIColor whiteColor];
        [_pStatusView addTarget:self action:@selector(retryDown:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pStatusView;
}
#pragma mark -【数据加载失败，需要点击Action】
- (void)retryDown:(id)sender {
    
}
// 改回原来的loading样式
- (UIView *)loadingView {
    if ( !_loadingView ) {
        _loadingView = [[UIView alloc] init];
        _loadingView.backgroundColor = Kwhite;
        
        [_loadingView addSubview:_statusLoadingView];
    }
    _statusLoadingView.origin = CGPointMake((_loadingView.width - _statusLoadingView.width)/2.0,
                                            (_loadingView.height - _statusLoadingView.height)/2.0);//2.0
    return _loadingView;
}
#pragma mark -【数据加载中 GIFLonding.....】
- (void)showLoading:(BOOL)bShow {
    if ( _pStatusView ) {
        [_pStatusView removeFromSuperview];
    }
    
    if ( bShow ) {
        self.loadingView.frame = [self frameOfPageStatusView];
        //        [_statusLoadingView startAnimation];
        [self.view addSubview:self.loadingView];
        self.loadingView.backgroundColor = [UIColor whiteColor];
        
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loading@2x" ofType:@"gif"]];
        FLAnimatedImage *waitImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data];
        _statusLoadingView.animatedImage = waitImage;
        
    } else {
        //        [_statusLoadingView stopAnimation];
        [self.loadingView removeFromSuperview];
    }
}
#pragma mark -【数据加载完 GIF关闭】
- (void)showEmpty:(BOOL)bShow {
    [self showLoading:NO];
    
    if ( bShow ) {
        self.pStatusView.frame = [self frameOfPageStatusView];
        [self.pStatusView setImage:[self imageForEmpty]
                             title:[self titleForEmpty]
                          subTitle:[self subtitleForEmpty]];
        [self.view addSubview:self.pStatusView];
        
    } else {
        [self.pStatusView removeFromSuperview];
    }
}
#pragma mark -【网络数据请求失败的情况】
- (void)showError:(BOOL)bShow error:(NSString *)error {
    [self showLoading:NO];
    
    if ( bShow ) {
        self.pStatusView.frame = [self frameOfPageStatusView];
        [self.pStatusView setImage:[self imageForError:nil]
                             title:@"加载错误！请点击重试!"
                          subTitle:error];
        [self.view addSubview:self.pStatusView];
        
        //保持naviBar在顶部
        //        [self.view bringSubviewToFront:_naviBar];
        
    } else {
        if ( _pStatusView.superview ) {
            [_pStatusView removeFromSuperview];
        }
    }
}

- (UIImage *)imageForEmpty {
    
    return [UIImage imageNamed:@"placeholder_newThread"];
}

- (NSString*)titleForEmpty {
    return @"很抱歉，这里空无一物.";
}

- (NSString*)subtitleForEmpty {
    return @"";
}

- (UIImage *)imageForError:(NSError *)error {
    
    return [UIImage imageNamed:@"placeholder_error"];
}

- (NSString*)titleForError:(NSError*)error {
    
    return @"页面加载错误,点击重试";
}
//
//- (NSString*)subtitleForError:(NSError *)error {
//    
//    if([error localizedDescription].length){
//        return [NSString stringWithFormat:@"%@(%ld)",[error localizedDescription],(long)error.code];
//    }else{
//        return @"";
//    }
//    
//}


- (CGRect)frameOfPageStatusView {
    if ( !self.navigationController ) {
        return self.view.bounds;
    } else {
        return CGRectMake(0, _origenY, SCREEN_WIDTH, self.view.frame.size.height - _origenY);
        //        return CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, self.view.frame.size.height - SafeAreaTopHeight);
    }
}

- (void)refreshOrigenValue {
    // 确定 _origenY
    BOOL naviHidden = [self navigationBarHidden];
    CGSize navSize = [self naviBarFrameSize];
    
    if ( _isIOS7orLater ) {
        if ( naviHidden ) {
            // 详情页特殊处理
            _origenY = 0;
        } else {
            _origenY = navSize.height;
        }
    } else {
        if ( naviHidden ) {
            _origenY = 0;
        } else {
            _origenY = navSize.height;
        }
    }
    
}

- (BOOL)navigationBarHidden {
    return NO;
}

- (CGSize)naviBarFrameSize {
    if ( [UIDevice isIOS7OrLatter] ) {
        return CGSizeMake(SCREEN_WIDTH, 75);
    } else {
        return CGSizeMake(SCREEN_WIDTH, 55);
    }
    //    return CGSizeMake(SCREEN_WIDTH, SafeAreaTopHeight);
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
