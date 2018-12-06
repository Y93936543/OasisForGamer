//
//  BannerCell.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "BannerCell.h"
#import "SDCycleScrollView.h"

@interface BannerCell()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray *imagesURLStrings;

@end

@implementation BannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray*)data
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子视图
        _imagesURLStrings = data;
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    // 网络加载图片的轮播器
    SDCycleScrollView *banner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, DEVICE_Height_Scale * 150) delegate:self placeholderImage:nil];
    banner.imageURLStringsGroup = _imagesURLStrings;
    [self addSubview:banner];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    JNLOGDebug(@"%ld",(long)index);
    if (self.bannerBlock) {
        self.bannerBlock(index);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
