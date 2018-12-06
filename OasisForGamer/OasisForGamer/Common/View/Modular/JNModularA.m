//
//  JNModularA.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/5.
//  Copyright © 2018年 ywj. All rights reserved.
//

#import "JNModularA.h"
#import "UIMacro.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface JNModularA()

//数据源 接收传递过来的数据
@property (nonatomic, strong) NSArray *dicData;

@end

@implementation JNModularA

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dicData
{
    if (self = [super initWithFrame:frame]) {
        _dicData = dicData;
        [self setUI];
    }
    return self;
}

- (void) setUI{
    //水平滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 20, 110)];
    scrollView.contentSize = CGSizeMake(_dicData.count * ((((DEVICE_WIDTH - 40) / 3) * 2) + 20) - 20, 110);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < _dicData.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * ((((DEVICE_WIDTH - 30) / 3) * 2) + 10), 0, DEVICE_Width_Scale * 223.33, 110)];
        view.tag = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressBtn:)];
        [view addGestureRecognizer:tapGestrue];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_Width_Scale * 223.33, 80)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:_dicData[i][@"imageUrl"]]];
        [view addSubview:imageView];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, DEVICE_Width_Scale * 223.33 - 10, 16)];
        label.text = _dicData[i][@"title"];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        [view addSubview:label];
        [scrollView addSubview:view];
    }
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
}

- (void) pressBtn:(UITapGestureRecognizer*)sender{
    //图片视图
    if (self.selectedBlock) {
        self.selectedBlock([_dicData[[sender.view tag]][@"id"] intValue] , [sender.view tag]);
    }
}

@end
