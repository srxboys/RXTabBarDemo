//
//  RXTabBarBottomView.h
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 默认 字体大小颜色 */

@interface RXTabBarBottomView : UIView

@property (nonatomic, assign, readonly) NSInteger tagBar;//tag 0为nil 1开始

/** 设置通用 字体大小颜色 */
- (void)barButtonCommentFont:(UIFont*)font normalColor:(UIColor *)NormalColor selectedColor:(UIColor *)SelectedColor;

/** 改变某个 字体大小颜色 */
- (void)barButtonWithTag:(NSInteger)tag fontFont:(UIFont*)font normalColor:(UIColor *)NormalColor selectedColor:(UIColor *)SelectedColor;

/** 添加 标签 按钮 */
- (void)addBarButtonWithTitle:(NSString *)title normalImgName:(NSString *)NormalImgName selectedImgName:(NSString *)SelectedImgName;

/** 插入 标签 按钮 */
- (void)insertBarButtonWithIndex:(NSInteger)num title:(NSString *)title normalImgName:(NSString *)NormalImgName selectedImgName:(NSString *)SelectedImgName;

/** 删除 标签 按钮 */
- (void)removeBarButtonWithIndex:(NSInteger)num;

@end
