//
//  RXTabBarModel.h
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXTabBarButtonModel : NSObject
@property (nonatomic, assign) NSInteger tagButton;
@property (nonatomic, assign) BOOL selected;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * nomalImage;
@property (nonatomic, copy) NSString * selectedImage;
@property (nonatomic, copy) UIFont   * nomalFont;
@property (nonatomic, copy) UIFont   * selectedFont;
@property (nonatomic, copy) UIColor  * nomalColor;
@property (nonatomic, copy) UIColor  * selectedColor;

@property (nonatomic, assign) CGSize  size;
@end
