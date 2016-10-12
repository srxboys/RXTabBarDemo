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
