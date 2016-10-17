//
//  RXHomeViewController.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import "RXHomeViewController.h"

#import "RXSecondViewController.h"

@interface RXHomeViewController ()
{
    RXSecondViewController * _secondController;
}
@end

@implementation RXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
//    self.view.backgroundColor = [UIColor magentaColor];
    _secondController = [[RXSecondViewController alloc] init];

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 80, 90, 100);
    [btn setTitle:@"UIButton" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    label.numberOfLines = 0;
    //    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    label.text = @"    srxboys RXTabBarDemo\nUITabBarController的UITabBar 完全自定义，你也可以看看写出自己style";
    [self.view addSubview:label];
    
}

- (void)buttonClick {
    _secondController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:_secondController animated:YES];
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
