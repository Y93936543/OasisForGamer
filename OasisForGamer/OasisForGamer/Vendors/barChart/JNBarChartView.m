//
//  JNBarChartView.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBarChartView.h"
#import "SimpleBarChart.h"

@interface JNBarChartView ()<SimpleBarChartDelegate,SimpleBarChartDataSource>{
    NSDictionary *_performanceData;
}

@property (nonatomic,strong)UILabel *payUserCountLable;
@property (nonatomic,strong)UILabel *yesterDayAmountLable;
@property (nonatomic,strong)UILabel *commissionLable;

@property (nonatomic,strong)UIButton *payUserCountButton;
@property (nonatomic,strong)UIButton *yesterDayAmountButton;
@property (nonatomic,strong)UIButton *commissionButton;

@property (nonatomic,strong)SimpleBarChart *barChartView;

@property (nonatomic,strong)NSArray *dataSource;
@property (nonatomic,strong)NSArray *titles;

@end


@implementation JNBarChartView

- (void)reloadData:(NSDictionary *)data{
    _performanceData = data;
    self.dataSource = _performanceData[@"barData"];
    //昨日付费玩家
    [self addSubview:self.payUserCountLable];
    self.payUserCountLable.text = [NSString stringWithFormat:@"昨日付费玩家: %@",_performanceData[@"payUserCount"]];
    [self.payUserCountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(self).offset(20);
        //make.size.mas_equalTo(CGSizeMake(100.0, 50));
    }];
    
    [self addSubview:self.payUserCountButton];
    [self.payUserCountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payUserCountLable).offset(5);
        make.left.mas_equalTo(self.payUserCountLable.mas_right).offset(10);
    }];
    
    //昨日流水
    [self addSubview:self.yesterDayAmountButton];
    [self.yesterDayAmountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payUserCountButton);
        make.right.equalTo(self).offset(-20);
    }];
    
    [self addSubview:self.yesterDayAmountLable];
    self.yesterDayAmountLable.text = [NSString stringWithFormat:@"昨日流水: %@",_performanceData[@"yesterDayAmount"]];
    [self.yesterDayAmountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payUserCountLable);
        make.right.mas_equalTo(self.yesterDayAmountButton.mas_left).offset(-10);
    }];
    
    //图表
    [self addSubview:self.barChartView];
    self.barChartView.frame = CGRectMake(20.0,70,self.bounds.size.width-40,160.0);
    
//    [self.barChartView reloadData];
    
    //分割线
    UILabel *line = [[UILabel alloc] init];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.barChartView.mas_bottom).offset(10);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    //当前提成点位
    [self addSubview:self.commissionLable];
    self.commissionLable.text = [NSString stringWithFormat:@"当前提成点位: %@",_performanceData[@"commission"]];
    [self.commissionLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line).offset(20);
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.commissionButton];
    [self.commissionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commissionLable).offset(5);
        make.left.mas_equalTo(self.commissionLable.mas_right).offset(10);
    }];
    [self.barChartView reloadData];
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//
//    }
//    return self;
//}

- (void)setupUI{
    self.backgroundColor = [UIColor grayColor];
}

- (void)detailClick:(UIButton *)btn{
    self.detailItemBlock(btn.tag);
}

#pragma mark - SimpleBarChartDelegate and SimpleBarChartDataSource
- (void)animationDidEndForBarChart:(SimpleBarChart *)barChart{
    
}

- (NSUInteger)numberOfBarsInBarChart:(SimpleBarChart *)barChart
{
    return self.dataSource.count;
}

- (CGFloat)barChart:(SimpleBarChart *)barChart valueForBarAtIndex:(NSUInteger)index
{
    return [[self.dataSource objectAtIndex:index] floatValue];
}

- (NSString *)barChart:(SimpleBarChart *)barChart textForBarAtIndex:(NSUInteger)index
{
    return [[self.dataSource objectAtIndex:index] stringValue];
}

- (NSString *)barChart:(SimpleBarChart *)barChart xLabelForBarAtIndex:(NSUInteger)index
{
    //NSString *str = [NSString stringWithFormat:@"周%li",index+1];
    return [self.titles objectAtIndex:index];
}

- (UIColor *)barChart:(SimpleBarChart *)barChart colorForBarAtIndex:(NSUInteger)index
{
    //int tag = (int)index%6;
    return [UIColor whiteColor];
}

#pragma mark - lazy
- (NSArray *)titles{
    if (!_titles) {
        _titles = @[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"];
    }
    return _titles;
}

- (UILabel *)payUserCountLable{
    if (!_payUserCountLable) {
        _payUserCountLable = [[UILabel alloc] init];
        _payUserCountLable.font = [UIFont boldSystemFontOfSize:17];
        _payUserCountLable.textColor = [UIColor whiteColor];
    }
    
    return _payUserCountLable;
}

- (UILabel *)yesterDayAmountLable{
    if (!_yesterDayAmountLable) {
        _yesterDayAmountLable = [[UILabel alloc] init];
        _yesterDayAmountLable.font = [UIFont boldSystemFontOfSize:17];
        _yesterDayAmountLable.textColor = [UIColor whiteColor];
    }
    
    return _yesterDayAmountLable;
}

- (UILabel *)commissionLable{
    if (!_commissionLable) {
        _commissionLable = [[UILabel alloc] init];
        _commissionLable.font = [UIFont boldSystemFontOfSize:17];
        _commissionLable.textColor = [UIColor whiteColor];
    }
    
    return _commissionLable;
}

- (UIButton *)payUserCountButton{
    if (!_payUserCountButton) {
        _payUserCountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _payUserCountButton.tag = 100;
        _payUserCountButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_payUserCountButton setTitle:@"详情" forState:UIControlStateNormal];
        [_payUserCountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_payUserCountButton addTarget:self action:@selector(detailClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payUserCountButton;
}

- (UIButton *)yesterDayAmountButton{
    if (!_yesterDayAmountButton) {
        _yesterDayAmountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _yesterDayAmountButton.tag = 101;
        _yesterDayAmountButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_yesterDayAmountButton setTitle:@"详情" forState:UIControlStateNormal];
        [_yesterDayAmountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_yesterDayAmountButton addTarget:self action:@selector(detailClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesterDayAmountButton;
}

- (UIButton *)commissionButton{
    if (!_commissionButton) {
        _commissionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commissionButton.tag = 102;
        _commissionButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commissionButton setTitle:@"详情" forState:UIControlStateNormal];
        [_commissionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_commissionButton addTarget:self action:@selector(detailClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commissionButton;
}

- (SimpleBarChart *)barChartView{
    if (!_barChartView) {
        
        _barChartView = [[SimpleBarChart alloc] initWithFrame:CGRectZero];
        //_barChartView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
        _barChartView.delegate = self;
        _barChartView.dataSource = self;
        _barChartView.barShadowOffset = CGSizeMake(2.0, 1.0);
        _barChartView.animationDuration = 1.0;
        _barChartView.barShadowColor = [UIColor grayColor];
        _barChartView.barShadowAlpha = 0.5;
        _barChartView.barShadowRadius = 1.0;
        _barChartView.barWidth = 18.0;
        _barChartView.xLabelType = SimpleBarChartXLabelTypeHorizontal;
        _barChartView.incrementValue = 100;
        _barChartView.barTextType = SimpleBarChartBarTextTypeTop;
        _barChartView.barTextColor = [UIColor whiteColor];
        _barChartView.gridColor = [UIColor groupTableViewBackgroundColor];
        _barChartView.xLabelColor = [UIColor whiteColor];
        _barChartView.yLabelColor = [UIColor whiteColor];
        //_barChartView.backgroundColor = [UIColor grayColor];
    }
    return _barChartView;
}

@end
