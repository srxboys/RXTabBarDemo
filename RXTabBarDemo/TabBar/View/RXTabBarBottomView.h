//
//  RXTabBarBottomView.h
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RXTabBarBottomViewDelegate <NSObject>

@required
- (void)tabBarBottomBarItemClick:(NSInteger)index;

@optional

@end

@interface RXTabBarBottomView : UIView

@property (nonatomic, strong) id<RXTabBarBottomViewDelegate>delegate;

@property (nonatomic, assign) NSInteger selectedIndex;

/** 设置通用 字体大小颜色 */
- (void)barButtonCommentFont:(UIFont*)font normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;
- (void)barButtonCommentNomalFont:(UIFont*)nomalFont selectedFont:(UIFont *)selectedFont normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

/** 改变某个 字体大小颜色 */
- (void)barButtonWithTag:(NSInteger)tag nomalFont:(UIFont*)nomalFont selectedFont:(UIFont *)selectedFont normalColor:(UIColor *)NormalColor selectedColor:(UIColor *)SelectedColor;

/** 添加 标签 按钮 */
- (void)addBarButtonWithTitle:(NSString *)title normalImgName:(NSString *)ormalImgName selectedImgName:(NSString *)selectedImgName;

/** 根据位置插入 标签 按钮 */
- (void)insertBarButtonWithIndex:(NSInteger)num title:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName;

/** 删除 标签 按钮 */
- (void)removeBarButtonWithIndex:(NSInteger)num;

- (void)removeALLBar;

/** 刷新 后，重新排列界面 */
- (void)reloadTabBarUI;

@end
