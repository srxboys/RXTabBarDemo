//
//  RXTabBarController.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import "RXTabBarController.h"
#import "RXTabBarBottomView.h"

#import "RXHomeViewController.h"
#import "RXThreeViewController.h"

#define NavHeight     64
#define TabbarHeight  49


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define TabBarStyleButtonTop  ScreenHeight - 100

#define ImageURL @"http://img.lanrentuku.com/img/allimg/1212/5-121204193R6.gif"
#define Activiety_URL @"http://img.lanrentuku.com/img/allimg/1212/5-121204193R1-50.gif"

#define GoodImgURL @"http://img.lanrentuku.com/img/allimg/1407/5-140FG92021-55.gif"

@interface RXTabBarController ()<UINavigationControllerDelegate, RXTabBarBottomViewDelegate>
{
    RXTabBarBottomView * _bottomBar;
    
    UIViewController * _currentActivitlyController;
    
    UIButton * _styleButtonOne;
    UIButton * _styleButtonTwo;
}
@end

@implementation RXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blueColor];
//    return;
    
    // ---- 控制器 ---
    RXHomeViewController * home = [[RXHomeViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:home];
    home.tabBarItem.title = @"";
    nav.delegate = self;

    
    
    RXThreeViewController * vc = [[RXThreeViewController alloc] init];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.title = @"";
    nav2.delegate = self;
    self.viewControllers = @[nav,nav2];
    [[UITabBar appearance] setTintColor:[UIColor clearColor]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

    
    //标签栏
    _bottomBar = [[RXTabBarBottomView alloc] initWithFrame:self.tabBar.bounds];
    _bottomBar.delegate = self;
    [self.tabBar addSubview:_bottomBar];
    [_bottomBar addBarButtonWithTitle:@"推荐" normalImgName:@"tab_0" selectedImgName:@"tab_0_h" networkFaidImage:@"tab_0_h"];
    [_bottomBar addBarButtonWithTitle:@"分类" normalImgName:@"tab_1" selectedImgName:ImageURL networkFaidImage:@"tab_1_h"];
    
    
    
    [_bottomBar reloadTabBarUI];
    
    
    //显示第一个
    self.selectIndex = 0;
    _currentActivitlyController = nav;
    
    
    
    UIImage * image = [UIImage imageNamed:@"tab_0"];
    NSLog(@"%@", NSStringFromCGSize(image.size));
    
    /**/
    _styleButtonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    _styleButtonOne.frame = CGRectMake(10, TabBarStyleButtonTop , 70, 40);
    _styleButtonOne.backgroundColor = [UIColor blueColor];
    [_styleButtonOne setTitle:@"样式一" forState:UIControlStateNormal];
    _styleButtonOne.tag = 1;
    [_styleButtonOne addTarget:self action:@selector(tabBarStyleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_styleButtonOne];
    
    _styleButtonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    _styleButtonTwo.frame = CGRectMake(90, TabBarStyleButtonTop, 70, 40);
    _styleButtonTwo.backgroundColor = [UIColor blueColor];
    [_styleButtonTwo setTitle:@"样式二" forState:UIControlStateNormal];
    _styleButtonTwo.tag = 2;
    [_styleButtonTwo addTarget:self action:@selector(tabBarStyleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_styleButtonTwo];
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(170, TabBarStyleButtonTop, 70, 40);
    btn3.backgroundColor = [UIColor blueColor];
    [btn3 setTitle:@"还原" forState:UIControlStateNormal];
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(tabBarStyleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

- (void)tabBarStyleButtonClick:(UIButton *)btn {
    NSInteger btnTag = btn.tag;
    if(btnTag == 1) {
        [_bottomBar addActivityButtonWithTitle:@"" normalImgName:GoodImgURL selectedImgName:Activiety_URL];
        _bottomBar.backImageURL = nil;
       
    }
    else if(btnTag == 2){
        [_bottomBar addBarButtonWithTitle:@"空空" normalImgName:@"tab_2" selectedImgName:ImageURL networkFaidImage:@"tab_2_h"];
        _bottomBar.backImageURL = Activiety_URL;
    }else {
        [_bottomBar removeALLBar];
        
        [_bottomBar addBarButtonWithTitle:@"推荐" normalImgName:@"tab_0" selectedImgName:@"tab_0_h" networkFaidImage:@"tab_0_h"];
        [_bottomBar addBarButtonWithTitle:@"分类" normalImgName:@"tab_1" selectedImgName:ImageURL networkFaidImage:@"tab_1_h"];
        _bottomBar.backImageURL = nil;
    }
    
     [_bottomBar reloadTabBarUI];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _currentActivitlyController = viewController;
}



- (void)setSelectIndex:(NSInteger)selectIndex {
    if(self.selectedIndex == selectIndex) {
        return;
    }
    
    if(self.viewControllers.count <= selectIndex) return;
    
    self.selectedIndex = selectIndex;
}



- (void)tabBarBottomBarItemClick:(NSInteger)index {
    [self setSelectIndex:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
