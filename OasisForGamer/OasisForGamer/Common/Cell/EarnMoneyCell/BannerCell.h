//
//  BannerCell.h
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BannerBlock) (NSUInteger index);

@interface BannerCell : UITableViewCell

//Banner点击回调
@property (nonatomic, strong) BannerBlock bannerBlock;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray*)data;

@end

NS_ASSUME_NONNULL_END
