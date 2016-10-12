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

@interface RXTabBarController ()<UINavigationControllerDelegate, RXTabBarBottomViewDelegate>
{
    RXTabBarBottomView * _bottomBar;
    
    UIViewController * _currentActivitlyController;
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
    [_bottomBar addBarButtonWithTitle:@"推荐" normalImgName:@"tab_0" selectedImgName:@"tab_0_h"];
    [_bottomBar addBarButtonWithTitle:@"分类" normalImgName:@"tab_1" selectedImgName:@"tab_1_h"];
    
    [_bottomBar reloadTabBarUI];
    
    
    //显示第一个
    self.selectIndex = 0;
    _currentActivitlyController = nav;
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
    //改变 上一个按钮的样式 为nomal
    // 改index 按钮的样式 为selected
    self.selectedIndex = selectIndex;
}



- (void)tabBarBottomBarItemClick:(NSInteger)index {
    [self setSelectIndex:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
