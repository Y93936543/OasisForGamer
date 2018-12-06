//
//  JNBarChartCell.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBarChartCell.h"
#import "JNBarChartView.h"

@interface JNBarChartCell()

@property (nonatomic, strong) JNBarChartView *chartView;

@end

@implementation JNBarChartCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    //图表数据视图
    CGRect frame = CGRectMake(10, 0, DEVICE_WIDTH - 20, 300);
    _chartView = [[JNBarChartView alloc] initWithFrame:frame];
    
    __weak JNBarChartCell *weakSelf = self;
    self.chartView.detailItemBlock = ^(NSInteger index) {
        //100 101 102
        if (weakSelf.detailItemBlock) {
            weakSelf.detailItemBlock(index);
        }
    };
    [self addSubview:_chartView];
}

- (void)reloadData:(NSDictionary *)data{
    [self.chartView reloadData:data];
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
