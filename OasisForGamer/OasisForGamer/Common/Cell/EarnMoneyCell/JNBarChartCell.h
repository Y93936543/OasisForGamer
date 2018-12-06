//
//  JNBarChartCell.h
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DetailItemBlock) (NSUInteger index);

@interface JNBarChartCell : UITableViewCell

@property (nonatomic, strong) DetailItemBlock detailItemBlock;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void) reloadData:(NSDictionary*)data;

@end

NS_ASSUME_NONNULL_END
