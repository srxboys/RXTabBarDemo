//
//  RXTabBarBottomView.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

/*
 ------ 宽 高 定义 ----
 */
#pragma mark ---- 宽 高 定义 --------
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define NavHeight     64
#define TabbarHeight  49

#import "RXTabBarBottomView.h"

@interface RXTabBarBottomView ()
{
    NSMutableArray * button;
}
@end

@implementation RXTabBarBottomView

/** 不建议用 */
- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, ScreenWidth, TabbarHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
