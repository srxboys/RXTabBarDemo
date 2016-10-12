# RXTabBarDemo
###iOS object-C 自定义封装成 和 UITabBarView一样的功能。主要体现在 UITabBar样式上，可以随意修改

-
继承UITabBarController 写的 管理切换控制器
主要是写 UITabBar样式是 继承UIView
```objc
    //标签栏
    _bottomBar = [[RXTabBarBottomView alloc] initWithFrame:self.tabBar.bounds];
    _bottomBar.delegate = self;
    [self.tabBar addSubview:_bottomBar];
    
    [_bottomBar addBarButtonWithTitle:@"推荐" normalImgName:@"tab_0" selectedImgName:@"tab_0_h"];
    [_bottomBar addBarButtonWithTitle:@"分类" normalImgName:@"tab_1" selectedImgName:@"tab_1_h"];
    
    [_bottomBar reloadTabBarUI];
```

如果你有想说的可以 [issues I](https://github.com/srxboys/RXTabBarDemo/issues/new) 。
:sweat_smile::sweat_smile::sweat_smile::sweat_smile::sweat_smile:
