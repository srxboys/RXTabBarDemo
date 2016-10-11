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

@interface RXTabBarController ()<UINavigationControllerDelegate>
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
    //标签栏
    _bottomBar = [[RXTabBarBottomView alloc] init];
    [self.view addSubview:_bottomBar];
    
    // ---- 控制器 ---
    RXHomeViewController * home = [[RXHomeViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:home];
    nav.delegate = self;
    [self addChildViewController:nav];
    
    
    RXThreeViewController * vc = [[RXThreeViewController alloc] init];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:vc];
    nav2.delegate = self;
    [self addChildViewController:nav2];
    
    
   
    
    [_bottomBar addBarButtonWithTitle:@"推荐" normalImgName:@"tab_0" selectedImgName:@"tab_0_h"];
    [_bottomBar addBarButtonWithTitle:@"分类" normalImgName:@"tab_1" selectedImgName:@"tab_1_h"];
    
    [self showController];
}

- (void)showController {
    self.selectIndex = 0;
    if(self.childViewControllers.count <= 0) return;
    
    UIViewController * vc = self.childViewControllers[0];
    NSLog(@"%@", NSStringFromCGRect(vc.view.frame));
    [self.view addSubview:vc.view];
    [self.view bringSubviewToFront:_bottomBar];
}



- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _bottomBar.hidden = viewController.hidesBottomBarWhenPushed;
    if([self.childViewControllers containsObject:viewController]) {
        viewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - TabbarHeight);
    }
    else {
        viewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }
    
    _currentActivitlyController = viewController;
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if(_selectIndex == selectIndex) {
        return;
    }
    
    //改变 上一个按钮的样式 为nomal
    // 改index 按钮的样式 为selected
    
    _selectIndex = selectIndex;
    
    UIViewController * currentController = self.childViewControllers[selectIndex];
    
    [self.view addSubview:currentController.view];
    
    [self.view sendSubviewToBack:_currentActivitlyController.view];
    
    [self.view bringSubviewToFront:_bottomBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
