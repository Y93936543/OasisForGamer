//
//  JNBaseView.h 
//  OasisForGamer
//  自定义基类视图
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNBaseView : UIView

/* Subclass - 需要子类重写 */
- (void)setupUI; //初始化UI
- (void)setupLayout; //布局

@end

NS_ASSUME_NONNULL_END
