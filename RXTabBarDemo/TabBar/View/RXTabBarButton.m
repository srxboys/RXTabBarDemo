//
//  RXTabBarButtonView.m
//  RXTabBarDemo
//
//  Created by srx on 16/10/11.
//  Copyright © 2016年 https://github.com/srxboys. All rights reserved.
//

#import "RXTabBarButton.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImageView+WebCache.h"
#import "RXTabBarModel.h"
#import <objc/message.h>

#define RXMsgSend(...) ((void (*)(void *, SEL, RXTabBarButton*))objc_msgSend)(__VA_ARGS__)
#define RXMsgTarget(target) (__bridge void *)(target)

#define DEFAULT_IMAGE_WIDTH 24
#define DEFAULT_IMAGE_HEIGHT 22.5


///判断字符串是否 为 Url
@interface NSObject (urlBOOL)
- (BOOL)urlBOOL;
@end

@implementation NSObject (urlBOOL)
- (BOOL)urlBOOL {
    if([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    else if([self isKindOfClass:[NSString class]] && [(NSString *)self isEqualToString:@""]){
        return NO;
    }
    else if(![self isKindOfClass:[NSString class]]) {
        return NO;
    }
    else if ([(NSString *)self rangeOfString:@"http://"].location != NSNotFound ) {
        return YES;
    }
    else if ([(NSString *)self rangeOfString:@"https://"].location != NSNotFound ) {
        return YES;
    }
    else {
        return NO;
    }
}
@end


@interface RXTabBarButton ()
{
    FLAnimatedImageView * _imageView;
    UILabel * _titleLabel;
    
    CGSize _imageSize;
}
@property (nonatomic, weak)   id  buttonTarget;
@property (nonatomic, assign) SEL buttonAction;
@end

@implementation RXTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // code
        CGFloat left = (frame.size.width - DEFAULT_IMAGE_WIDTH)/2;
        _imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(left, 0, DEFAULT_IMAGE_WIDTH, DEFAULT_IMAGE_HEIGHT)];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, DEFAULT_LABEL_HEIGHT)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        self.isSelected = NO;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(barButtonClick)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
        
        _imageSize = CGSizeMake(DEFAULT_IMAGE_WIDTH, DEFAULT_IMAGE_HEIGHT);
        
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action {
    if(target == nil || action == nil) return;
    _buttonTarget = target;
    _buttonAction = action;
}

- (void)setModel:(RXTabBarButtonModel *)model {
    _model = model;
    [self changeContent];
}



- (void)barButtonClick {
    if(_buttonTarget) {
        
        _isSelected = !_isSelected;
        [self changeContent];
        
         RXMsgSend(RXMsgTarget(_buttonTarget), _buttonAction, self);
    }
}



- (void)changeOFNomal {
    if(!_model) return;
    _isSelected = NO;
    [self changeContent];
}

- (void)changeOFSelected {
    if(!_model) return;
    _isSelected = YES;
    [self changeContent];
}




- (void)changeContent {
    _titleLabel.text = _model.title;
    
    if(_isSelected) {
        _titleLabel.font = _model.selectedFont;
        _titleLabel.textColor = _model.selectedColor;
        
        [self reloadImageViewContentimageName:_model.selectedImage];
    }
    else {
        _titleLabel.font = _model.nomalFont;
        _titleLabel.textColor = _model.nomalColor;
        
        [self reloadImageViewContentimageName:_model.nomalImage];
    }
    
    
}

- (void)reloadImageViewContentimageName:(NSString *)image {
    if([_model.nomalImage urlBOOL]) {
        __weak typeof(self)weakSelf = self;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            _imageSize = image.size;
            _imageView.frame = CGRectMake(CGRectGetMaxX(_imageView.frame), CGRectGetMaxY(_imageView.frame), image.size.width, image.size.height);
//            NSLog(@"%@", NSStringFromCGSize(image.size));
            [weakSelf reloadButtonUI];
        }];
    }
    else {
        _imageView.image = [UIImage imageNamed:image];
        _imageSize = CGSizeMake(DEFAULT_IMAGE_WIDTH, DEFAULT_IMAGE_HEIGHT);
        _imageView.frame = CGRectMake(CGRectGetMaxX(_imageView.frame), CGRectGetMaxY(_imageView.frame), _imageSize.width, _imageSize.height);
        [self reloadButtonUI];
    }
}



- (void)reloadButtonUI {
   
    [_titleLabel sizeToFit];
    CGSize titleSize = _titleLabel.frame.size;
    
    
    CGSize imageSize = _imageSize;
    if (imageSize.width != 0 && imageSize.height != 0 && titleSize.height != 0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 5;
        _imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        _imageView.center = _imageView.center;
    } else {
        CGPoint imageViewCenter = _imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2 - 5;
        _imageView.center = imageViewCenter;
        _imageView.center = _imageView.center;
    }
    
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    _titleLabel.center = labelCenter;
    
}




@end
