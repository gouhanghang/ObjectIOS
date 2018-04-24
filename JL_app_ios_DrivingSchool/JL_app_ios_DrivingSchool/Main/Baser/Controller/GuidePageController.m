//
//  GuidePageController.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#import "GuidePageController.h"

@interface GuidePageController ()<UIScrollViewDelegate>
{
    UIPageControl *pageControl;
    UIScrollView *guideScroll;
    UIButton *_tiaoguobtn;
    UIButton *_longtbs;
}
@property (nonatomic , strong) NSArray *picArr;
@end

@implementation GuidePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    _picArr = @[
                @"new_0",
                @"new_1",
                @"new_2",];
    
    [self loadContentView];
    [UIApplication sharedApplication].statusBarHidden = YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

/**
 *  初始化界面
 */
- (void)loadContentView {
    guideScroll =[UIScrollView new];
    guideScroll.delegate = self;
    guideScroll.showsHorizontalScrollIndicator=NO;
    guideScroll.contentSize = CGSizeMake(SCREEN_WIDTH*self.picArr.count, 0);
    guideScroll.userInteractionEnabled = YES;
    guideScroll.bounces = NO;
    guideScroll.pagingEnabled = YES;
    [self.view addSubview:guideScroll];
    [guideScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(SCREEN_HEIGHT == 812.0 ? -44 : -22);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT+(SCREEN_HEIGHT==812.0?44:22));
    }];
    
    
    //    pageControl= [[UIPageControl alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-20, SCREEN_WIDTH, 10)];
    //    pageControl.currentPageIndicatorTintColor= KAllBcakColor;//[UIColor blueColor];
    //    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    //    [self.view addSubview:pageControl];
    //    pageControl.numberOfPages=3;
    
    
    NSMutableArray *imgAry=[NSMutableArray array];
    
    for (int i=0; i< _picArr.count;i++) {
        NSString *imgName = _picArr[i];
        UIImageView *imgView =[UIImageView new];
        imgView.image=JLImage(imgName);
        //        [imgView sd_setImageWithURL:[NSURL URLWithString:imgName]];
        [guideScroll addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        imgView.contentMode=UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds=YES;
        [imgAry addObject:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH*i);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(SCREEN_HEIGHT);
        }];
    }
    

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn setTitleColor:JLhax(@"#ff6666") forState:UIControlStateNormal];
    btn.titleLabel.font=JLFont(13);
    btn.layer.cornerRadius=2;
    btn.hidden=YES;
    btn.layer.borderColor=JLhax(@"#ff6666").CGColor;
    btn.layer.borderWidth=1;
    btn.tag=100;
    [btn addTarget:self action:@selector(startApp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SCREEN_WIDTH-80);
        make.top.mas_equalTo(SCREEN_HEIGHT==812.0?50:40);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30*SCALEWITH6);
    }];
    _tiaoguobtn=btn;
    
    UIButton *btns=[UIButton buttonWithType:UIButtonTypeCustom];
    [btns setTitle:@"立即体验" forState:UIControlStateNormal];
    [btns setTitleColor:Kwhite forState:UIControlStateNormal];
    btns.titleLabel.font=JLFont(13);
    btns.tag=101;
    btns.hidden=YES;
    [btns addTarget:self action:@selector(startApp:) forControlEvents:UIControlEventTouchUpInside];
    btns.backgroundColor=JLhax(@"#ff6666");
    btns.layer.cornerRadius=(30*SCALEWITH6)/2;
    [self.view addSubview:btns];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(SCREEN_WIDTH/2-75);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(SCREEN_HEIGHT-70*SCALEWITH6);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30*SCALEWITH6);
    }];
    _longtbs=btns;
    //    [[imgAry lastObject] addSubview:vies];
}
/**
 *  启动app
 */
- (void)startApp:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {
            JLTabBarController *homevc= [[JLTabBarController alloc]init];
            [UIApplication sharedApplication].keyWindow.rootViewController = homevc;
        }
            break;
        case 101:
        {

            //     做其它的 操作。
        }
            break;
            
        default:
            break;
    }
    
    
    
}



#pragma UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int currentPage=guideScroll.contentOffset.x;
    if (currentPage==SCREEN_WIDTH*2) {
        _tiaoguobtn.hidden=NO;
        _longtbs.hidden=NO;
    }else{
        _tiaoguobtn.hidden=YES;
        _longtbs.hidden=YES;
    }
    //    int currentPage = (guideScroll.contentOffset.x - SCREEN_WIDTH
    //                       / ([_picArr count]+1)) / SCREEN_WIDTH + 1;
    //
    //    pageControl.currentPage = currentPage;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    XTDTabBarController *tabs = [XTDTabBarController new];
    //
    //    [UIApplication sharedApplication].keyWindow.rootViewController = tabs;
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

