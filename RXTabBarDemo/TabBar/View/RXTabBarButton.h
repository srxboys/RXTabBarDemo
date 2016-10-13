//
//  RXTabBarButtonView.h
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEFAULT_LABEL_HEIGHT 10

@class RXTabBarButtonModel;

@interface RXTabBarButton : UIView
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) BOOL isActivity;
@property (nonatomic, copy) RXTabBarButtonModel * model;

- (void)addTarget:(id)target action:(SEL)action;


/** */
- (void)changeOFNomal;

/** */
- (void)changeOFSelected;

@end
