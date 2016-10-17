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
#import "FLAnimatedImageView.h"
#import "FLAnimatedImageView+WebCache.h"

#import "RXTabBarModel.h" //数据模型
#import "RXTabBarButton.h" //按钮

/** 默认字体颜色 */
#define DEFAUL_FONT_NOMAL     [UIFont systemFontOfSize:DEFAULT_LABEL_HEIGHT]
#define DEFAUL_FONT_SELECTED  [UIFont systemFontOfSize:DEFAULT_LABEL_HEIGHT]
#define DEFAUL_COLOR_NOMAL    [UIColor darkGrayColor]
#define DEFAUL_COLOR_SELECTED [UIColor redColor]
#define DEFAUL_LINE_COLOR     [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1.0f]//#AAAAAA


@interface RXTabBarBottomView ()
{
    FLAnimatedImageView * _backImageView;
    
    UIView * _lineView;
    
    UIFont  * _barNomalFont;
    UIFont  * _barSelectedFont;
    UIColor * _barNomalColorl;
    UIColor * _barSelectColor;
    
    RXTabBarButton * _currentBtn;
    NSInteger _tagTabBar;
    NSInteger _tag_activity;
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
        
        self.backgroundColor = [UIColor whiteColor];
        //默认字体颜色
        _barNomalFont = DEFAUL_FONT_NOMAL;
        _barSelectedFont = DEFAUL_FONT_SELECTED;
        _barNomalColorl = DEFAUL_COLOR_NOMAL;
        _barSelectColor = DEFAUL_COLOR_SELECTED;
        _barArray = [[NSMutableArray alloc] init];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, LINE_Height)];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_lineView];
        
        _backImageView = [[FLAnimatedImageView alloc] initWithFrame:self.bounds];
        _backImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_backImageView];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, LINE_Height)];
        _lineView.backgroundColor = DEFAUL_LINE_COLOR;
        _lineView.tag = 1000;
        [self addSubview:_lineView];
        
        _backImageView = [[FLAnimatedImageView alloc] initWithFrame:self.bounds];
        _backImageView.backgroundColor = [UIColor clearColor];
        _backImageView.tag = 1001;
        [self addSubview:_backImageView];
        _tagTabBar = 0;
        _tag_activity = 2000;
    }
    return self;
}

//- (void)setSelectedIndex:(NSInteger)selectedIndex {
//    if(selectedIndex < _barArray.count)
//        _selectedIndex = selectedIndex;
//    [_currentBtn changeOFNomal];
//    _currentBtn = (RXTabBarButton *)[self viewWithTag:selectedIndex + 1];
//    [_currentBtn changeOFSelected];
//}

- (NSInteger)selectedIndex {
    return _currentBtn.tag - 1;
}

- (void)tabBarItmeActivityClick:(RXTabBarButton *)tabBarItem toTabBarSelectedIndex:(NSInteger)selectedIndex {
    [_currentBtn changeOFNomal];
    [tabBarItem changeOFNomal];
    _currentBtn = (RXTabBarButton *)[self viewWithTag:selectedIndex + 1];
    [_currentBtn changeOFSelected];
}

- (void)setBackImageURL:(NSString *)backImageURL {
    if(backImageURL.length <= 0 || backImageURL == nil) {
        _backImageView.image = [[UIImage alloc] init];
        return;
    };
    _backImageURL = backImageURL;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:backImageURL]];

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
- (void)addBarButtonWithTitle:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName networkFaidImage:(NSString *)image{
    
    //~~~~ coding ~~~~
    _tagTabBar ++;
    RXTabBarButtonModel * model = [[RXTabBarButtonModel alloc] init];
    model.title = title;
    if(title == nil || title.length <= 0) {
        NSString * tabBarTitle;
        switch (_tagTabBar - 1) {
            case 0:
                tabBarTitle = @"推荐";
                break;
            case 1:
                tabBarTitle = @"逛";
                break;
            case 2:
                tabBarTitle = @"购物车";
                break;
            case 3:
                tabBarTitle = @"我的";
                break;
            default:
                tabBarTitle = @"";
                break;
        }
        model.title = tabBarTitle;
    }
    
    model.nomalFont = _barNomalFont;
    model.selectedFont = _barSelectedFont;
    model.nomalColor = _barNomalColorl;
    model.selectedColor = _barSelectColor;
    model.nomalImage = normalImgName.length <= 0 ? normalImgName : TabBarItem_Nomal_Image((_tagTabBar - 1)%4);
    model.selectedImage = selectedImgName.length <= 0 ? selectedImgName : TabBarItem_selected_Image((_tagTabBar - 1)%4);
    model.isActivity = NO;
    model.tagTabBar = _tagTabBar;
    [_barArray addObject:model];
    
}

- (void)addActivityButtonWithTitle:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName {
    _tag_activity ++;
    RXTabBarButtonModel * model = [[RXTabBarButtonModel alloc] init];
    model.title = title;
    model.nomalFont = _barNomalFont;
    model.selectedFont = _barSelectedFont;
    model.nomalColor = _barNomalColorl;
    model.selectedColor = _barSelectColor;
    model.nomalImage = normalImgName;
    model.selectedImage = selectedImgName;
    model.isActivity = YES;
    model.tagTabBar = _tag_activity - 1;
    
    [_barArray insertObject:model atIndex:_barArray.count/2];
    
}


/** 插入 标签 按钮 */
- (void)insertBarButtonWithIndex:(NSInteger)num title:(NSString *)title normalImgName:(NSString *)normalImgName selectedImgName:(NSString *)selectedImgName {
    //~~~~ coding ~~~~
     return;
    
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

- (void)removeBarActivityButton {
    if(_barArray.count <= 0) return;
    [self removeBarButtonWithIndex:_barArray.count/2];
}

- (void)removeALLBar {
    [_barArray removeAllObjects];
    [self removeALLTabBarButtonView];
//    _selectedIndex = 0;
    [self reloadTabBarUI];
}


- (void)removeALLTabBarButtonView {
    for (UIView * view in self.subviews) {
        if([view isMemberOfClass:[RXTabBarButton class]]) {
            [view removeFromSuperview];
        }
    }
    _tagTabBar = 0;
    _tag_activity = 2000;
}

- (void)reloadTabBarUI {
    NSInteger startIndex = 0;
    //一种情况
//    CGFloat width = 44;
//    CGFloat space = roundf(ScreenWidth - (width *_barArray.count))/(_barArray.count + 1);
    
    //第二种比较 合理
    CGFloat width = ScreenWidth /_barArray.count * 1.0;
    CGFloat space = 0;

    CGFloat top = LINE_Height;
    CGFloat height = TabbarHeight - LINE_Height;
    
    
    
    for (UIView *view in self.subviews) {
        if([view isMemberOfClass:[RXTabBarButton class]]) {
            RXTabBarButtonModel * model = _barArray[startIndex];
            
            RXTabBarButton * btn = (RXTabBarButton *)view;
            btn.frame = CGRectMake(space + (startIndex * (width + space)), top, width, height);
            btn.tag = startIndex + 1;
            btn.model = model;
            btn.isSelected = NO;
            btn.isActivity = model.isActivity;
            if(startIndex == 0) {
                btn.isSelected = YES;
                _currentBtn = btn;
                [self changeButton:btn status:YES];
                
            }
            startIndex ++;
        }
    }
    
    
    for(;startIndex < _barArray.count; startIndex ++) {
        
        RXTabBarButtonModel * model = _barArray[startIndex];
        
        RXTabBarButton * btn = [[RXTabBarButton alloc] initWithFrame:CGRectMake(space + (startIndex * (width + space)), top, width, height)];
//        btn.backgroundColor = [UIColor colorWithRed:(arc4random() % 255)/255.0 green:(arc4random() % 255)/255.0 blue:(arc4random() % 255)/255.0 alpha:1];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = startIndex + 1;
        [btn setModel:model];
        [btn addTarget:self action:@selector(tabBarItmeClick:)];
        btn.isSelected = NO;
        btn.isActivity = model.isActivity;
        if(startIndex == 0) {
            btn.isSelected = YES;
            _currentBtn = btn;
            [self changeButton:btn status:YES];
        }
        
        [self addSubview:btn];
        
        
    }
    
}

- (void)tabBarItmeClick:(RXTabBarButton *)btn {
    if([self.delegate respondsToSelector:@selector(tabBarBottomBarItemClick:)]) {
        
        BOOL isTrue = [self.delegate tabBarBottomBarItemClick:btn];
        if(isTrue) {
            if(_currentBtn.tag == btn.tag) {
                [_currentBtn changeOFSelected];
                return;
            }
            
            [_currentBtn changeOFNomal];
            _currentBtn = btn;
        }
    }
}

- (void)changeButton:(RXTabBarButton *)btn status:(BOOL)status {
    
    if(_currentBtn.tag == btn.tag) {
        [_currentBtn changeOFSelected];
        return;
    }
    
    if(status) {
        _currentBtn = btn;
        [_currentBtn changeOFSelected];
    }
    else {
        [_currentBtn changeOFNomal];
        _currentBtn = btn;
    }
}

@end
