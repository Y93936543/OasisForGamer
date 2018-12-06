//
//  JNModularHead.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/6.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNModularHead.h"

@implementation JNModularHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void) setUI{
    //添加正标题
    _title = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, DEVICE_Width_Scale * 200, 16)];
    [self addSubview:_title];
    
    //添加副标题
    _subtitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, DEVICE_Width_Scale * 200, 16)];
    _subtitle.font = [UIFont systemFontOfSize:14];
    [self addSubview:_subtitle];
    
    //添加更多标签按钮
    _moreBtn = [[UILabel alloc] initWithFrame:CGRectMake(DEVICE_WIDTH - 60, 10, 60, 16)];
    UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressBtn:)];
    [_moreBtn addGestureRecognizer:tapGestrue];
    [self addSubview:_moreBtn];
}

- (void) pressBtn:(UITapGestureRecognizer*)sender{
    if (self.moreBtnBlock) {
        self.moreBtnBlock();
    }
}

@end
