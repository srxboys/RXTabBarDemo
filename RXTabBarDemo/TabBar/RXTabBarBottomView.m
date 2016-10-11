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
    NSMutableArray * _barArray;
    
    UIFont  * _barNomalFont;
    UIFont  * _barSelectedFont;
    UIColor * _barNomalColorl;
    UIColor * _barSelectColor;
}
@end

@implementation RXTabBarBottomView

/** 不建议用 */
- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, ScreenHeight - TabbarHeight, ScreenWidth, TabbarHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor redColor];
        //默认字体颜色
        _barNomalFont = [UIFont systemFontOfSize:14];
        _barSelectedFont = [UIFont systemFontOfSize:14];
        _barNomalColorl = [UIColor darkGrayColor];
        _barSelectColor = [UIColor redColor];
        
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if(selectedIndex > _barArray.count)
    
    _selectedIndex = selectedIndex;
}

/** 设置通用 字体大小颜色 */
- (void)barButtonCommentFont:(UIFont*)font normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    [self barButtonCommentNomalFont:font selectedFont:font normalColor:normalColor selectedColor:selectedColor];
}
- (void)barButtonCommentNomalFont:(UIFont*)nomalFont selectedFont:(UIFont *)selectedFont normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    _barNomalFont = nomalFont;
    _barSelectedFont = selectedFont;
    _barNomalColorl = normalColor;
    _barSelectColor = selectedColor;
}


/** 改变某个 字体大小颜色 */
- (void)barButtonWithTag:(NSInteger)tag nomalFont:(UIFont*)nomalFont selectedFont:(UIFont *)selectedFont normalColor:(UIColor *)NormalColor selectedColor:(UIColor *)SelectedColor {
    
}


/** 添加 标签 按钮 */
- (void)addBarButtonWithTitle:(NSString *)title normalImgName:(NSString *)NormalImgName selectedImgName:(NSString *)SelectedImgName {
    
}

/** 插入 标签 按钮 */
- (void)insertBarButtonWithIndex:(NSInteger)num title:(NSString *)title normalImgName:(NSString *)NormalImgName selectedImgName:(NSString *)SelectedImgName {
    
}

/** 删除 标签 按钮 */
- (void)removeBarButtonWithIndex:(NSInteger)num {
    
}

- (void)removeALLBar {
    for(UIView *view in [self subviews])
    {
        [view removeFromSuperview];
    }
    
    _selectedIndex = 0;
}

@end
