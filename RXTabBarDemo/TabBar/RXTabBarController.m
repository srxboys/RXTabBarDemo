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

@interface RXTabBarController ()
{
    RXTabBarBottomView * _bottomBar;
    
    RXHomeViewController * _home;
}
@end

@implementation RXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _bottomBar = [[RXTabBarBottomView alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:_bottomBar];
    
    _home = [[RXHomeViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:_home];
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
