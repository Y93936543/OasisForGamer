//
//  JNModularA.h
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SelectedBlock) (NSInteger _id, NSInteger index);

@interface JNModularA : UIView

//图片视图回调
@property (nonatomic, strong) SelectedBlock selectedBlock;

/**
 * 初始化方法
 * @pram frame 位置
 * @pram dicData 数据源
 */
- (instancetype)initWithFrame:(CGRect)frame data:(NSArray*)dicData;

@end

NS_ASSUME_NONNULL_END
