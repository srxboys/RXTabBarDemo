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
    
    _secondController = [[RXSecondViewController alloc] init];

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 80, 90, 100);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
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
