//
//  CodeTextDemo
//
//  Created by ywj on 2018/11/29.
//  Copyright © 2018年 ywj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^EndEditBlock) (NSString* str);

/**
 * 基础版 - 方块
 */
@interface JNCodeTextView : UIView

/// 当前输入的内容
@property (nonatomic, copy, readonly) NSString *code;

@property (nonatomic, copy) EndEditBlock endEditBlock;

- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (void)showKeyboard;

@end

NS_ASSUME_NONNULL_END
