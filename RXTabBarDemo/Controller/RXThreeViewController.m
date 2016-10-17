//
//  RXThreeViewController.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import "RXThreeViewController.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImageView+WebCache.h"

#define ImageURL @"http://img.lanrentuku.com/img/allimg/1212/5-121204193R6.gif"

@interface RXThreeViewController ()

@end

@implementation RXThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"不知道";
    
    FLAnimatedImageView * imgView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(10, 70, 20, 20)];
    imgView.backgroundColor = [UIColor redColor];
    [imgView sd_setImageWithURL:[NSURL URLWithString:ImageURL]];
    [self.view addSubview:imgView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    label.numberOfLines = 0;
//    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    label.text = @"    【注意】\n 当有activity itme(活动标签按钮)时 \n  由于【TabBarViewControll里的ViewControlls】和 【(没有activity)tabBar.tabBarItmes （_bottomBar addBarButtonWithTitle）】是一一对应的，我只对应了2个，在add时，导致显示错误，如果真实环境，记得一一对应，就不会出现BUG了";
    [self.view addSubview:label];
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
