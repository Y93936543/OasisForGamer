//
//  JNModularACell.h
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/6.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SelectedBlock) (NSInteger _id, NSInteger index);

@interface JNModularACell : UITableViewCell

//图片视图回调
@property (nonatomic, strong) SelectedBlock selectedBlock;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray*)data;

@end

NS_ASSUME_NONNULL_END
