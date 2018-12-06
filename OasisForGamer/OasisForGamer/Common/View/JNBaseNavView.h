//
//  JNBaseNavView.h
//  OasisForGamer
//  自定义导航栏
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNBaseNavView : JNBaseView

@property (nonatomic, strong) UIImage *leftIcon; //左侧按钮图标
@property (nonatomic, strong) UIImage *rightIcon; //右侧按钮图标
@property (nonatomic, strong) NSString *title;    //标题
@property (nonatomic, strong) UIColor *titleColor; //标题颜色
@property (nonatomic, strong) UIColor *bgColor;   //背景颜色
@property (nonatomic, strong) UIImage *bgImage;   //背景图片


- (void)addLeftTarget:(id)target selector:(SEL)selector; //添加左侧按钮事件
- (void)addRightTarget:(id)target selector:(SEL)selector;//添加右侧按钮事件

@end

NS_ASSUME_NONNULL_END
