//
//  JNBaseView.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseView.h"

@interface JNBaseView (){
    BOOL _commonInit; //是否已经加载
}

@end

@implementation JNBaseView

- (id)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    if (!_commonInit) {
        [self setupUI];
        _commonInit = YES;
    }
}

- (void)setupUI {}
- (void)setupLayout {}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
