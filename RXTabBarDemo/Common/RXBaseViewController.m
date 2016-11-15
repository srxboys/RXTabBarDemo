//
//  RXBaseViewController.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import "RXBaseViewController.h"

@interface RXBaseViewController ()<UIGestureRecognizerDelegate>
{
    UILabel * _navigationTitleView;
}
@end

@implementation RXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //隐藏 导航栏
//    [self setNavitaionControllerHidden:YES animated:NO];
    //显示 导航栏
    _navigationTitleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, 100, 30)];
    _navigationTitleView.textAlignment = NSTextAlignmentCenter;
//    _navigationTitleView.backgroundColor= [UIColor redColor];
    _navigationTitleView.font = [UIFont systemFontOfSize:18];
    
    self.navigationItem.titleView = _navigationTitleView;
}

- (void)setTitle:(NSString *)title {
    _navigationTitleView.text = title;
}


/** 隐藏导航栏，但不影响手势 */
- (void)setNavitaionControllerHidden:(BOOL)hidden animated:(BOOL)animated {
    //导航栏
    [self.navigationController setNavigationBarHidden:hidden animated:animated];
    self.navigationController.navigationBarHidden = YES;
    //自定义/隐藏/修改返回等 导航栏，默认向右滑手势会消失
    __weak typeof(self) bself = self;
    //    self.navigationController.delegate = self; //这个暂时不用，用了会崩溃
    //
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //当 跳转到 子界面时，会刚开始调用此方法
        self.navigationController.interactivePopGestureRecognizer.delegate = bself;
    }
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
