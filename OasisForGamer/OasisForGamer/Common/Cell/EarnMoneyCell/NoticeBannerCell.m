//
//  NoticeBannerCell.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "NoticeBannerCell.h"
#import "SDCycleScrollView.h"

@interface NoticeBannerCell()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation NoticeBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray*)data
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子视图
        _titles = data;
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    //横线
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(20, 10, DEVICE_WIDTH - 40, 0.5)];
    line1.backgroundColor = [UIColor grayColor];
    [self addSubview:line1];
    
    //公告标签
    UILabel *labNotice = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
    labNotice.text = @"公告";
    [self addSubview:labNotice];

    // 网络加载 --- 创建只上下滚动展示文字的轮播器
    // 由于模拟器的渲染问题，如果发现轮播时有一条线不必处理，模拟器放大到100%或者真机调试是不会出现那条线的
    SDCycleScrollView *bannerNotice = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(60, 15,  DEVICE_WIDTH - 100, 30) delegate:self placeholderImage:nil];
    bannerNotice.scrollDirection = UICollectionViewScrollDirectionVertical;
    bannerNotice.onlyDisplayText = YES;
    bannerNotice.titleLabelTextFont = [UIFont systemFontOfSize:18];
    bannerNotice.titleLabelTextColor = [UIColor grayColor];
    bannerNotice.titleLabelBackgroundColor = [UIColor whiteColor];
    bannerNotice.titlesGroup = _titles ;
    [self addSubview:bannerNotice];
    
    //横线
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(20, 50, DEVICE_WIDTH - 40, 0.5)];
    line2.backgroundColor = [UIColor grayColor];
    [self addSubview:line2];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    JNLOGDebug(@"%ld",(long)index);
    if (self.bannerBlock) {
        self.bannerBlock(index);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
