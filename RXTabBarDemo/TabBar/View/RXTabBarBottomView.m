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
#define LINE_Height 0.5

#import "RXTabBarBottomView.h" //底部bar

#import "RXTabBarModel.h" //数据模型
#import "RXTabBarButton.h" //按钮

@interface RXTabBarBottomView ()
{
    NSMutableArray * _barArray;
    
    UIView * _lineView;
    
    //默认字体颜色
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
        _barArray = [[NSMutableArray alloc] init];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, LINE_Height)];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_lineView];
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
- (void)addBarButtonWithTitle:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName {
    
    //~~~~ coding ~~~~
    
    RXTabBarButtonModel * model = [[RXTabBarButtonModel alloc] init];
    model.title = title;
    model.nomalFont = _barNomalFont;
    model.selectedFont = _barSelectedFont;
    model.nomalColor = _barNomalColorl;
    model.selectedColor = _barSelectColor;
    model.nomalImage = normalImgName;
    model.selectedImage = selectedImgName;
    [_barArray addObject:model];
    
}

/** 插入 标签 按钮 */
- (void)insertBarButtonWithIndex:(NSInteger)num title:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName {
    //~~~~ coding ~~~~
    RXTabBarButtonModel * model = [[RXTabBarButtonModel alloc] init];
    model.title = title;
    model.nomalFont = _barNomalFont;
    model.selectedFont = _barSelectedFont;
    model.nomalColor = _barNomalColorl;
    model.selectedColor = _barSelectColor;
    model.nomalImage = normalImgName;
    model.selectedImage = selectedImgName;
    
    
    
    if(num >= _barArray.count) {
        [_barArray addObject:model];
    }
    else {
        [_barArray addObject:model];
        for(NSInteger i = _barArray.count - 1; i > num; i --) {
            [_barArray exchangeObjectAtIndex:i withObjectAtIndex:i - 1];
        }
    }
    
    [self reloadTabBarUI];
    
}

/** 删除 标签 按钮 */
- (void)removeBarButtonWithIndex:(NSInteger)num {
    if(_barArray.count > num) {
        [_barArray removeObjectAtIndex:num];
    }
    [self reloadTabBarUI];
}

- (void)removeALLBar {
    [_barArray removeAllObjects];
    _selectedIndex = 0;
    [self reloadTabBarUI];
}

- (void)removeALLTabBarButtonView {
    for(UIView * view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)reloadTabBarUI {
    NSInteger startIndex = 0;
    CGFloat width = 44;
    CGFloat space = roundf(ScreenWidth - (width *_barArray.count))/(_barArray.count + 1);

    CGFloat top = LINE_Height;
    CGFloat height = TabbarHeight - LINE_Height;
    
    
    for(; startIndex < self.subviews.count; startIndex ++) {
        
        if([self.subviews[startIndex] isKindOfClass:[RXTabBarButton class]]) {
            RXTabBarButton * btn = self.subviews[startIndex];
            btn.frame = CGRectMake(space + (startIndex * (width + space)), top, width, height);
            btn.tag = startIndex + 1;
        }
    }
    
    if(self.subviews.count <= 1) {
        startIndex = 0;
    }
    
    for(;startIndex < _barArray.count; startIndex ++) {
        RXTabBarButton * btn = [[RXTabBarButton alloc] init];
    
        btn.frame = CGRectMake(space + (startIndex * (width + space)), top, width, height);
        btn.backgroundColor = [UIColor whiteColor];
        [self addSubview:btn];
        btn.tag = startIndex + 1;
        
        [btn addTarget:self action:@selector(tabBarItmeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)tabBarItmeClick:(RXTabBarButton *)btn {
    
    if([self.delegate respondsToSelector:@selector(tabBarBottomBarItemClick:)]) {
        [self.delegate tabBarBottomBarItemClick:btn.tag - 1];
    }
}

@end
