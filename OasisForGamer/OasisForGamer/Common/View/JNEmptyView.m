//
//  JNEmptyView.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNEmptyView.h"

@interface JNEmptyView()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *secondTitleLabel;

@end

@implementation JNEmptyView

#pragma mark init
- (id)init {
    if (self = [super init]) {
        
        [self setupUI];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.secondTitleLabel];
    
    [self setupLayout];
}

- (void)setupLayout {
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(100);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(self->_iconView.mas_bottom).offset(10);
        make.height.offset(30);
    }];
    [_secondTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(self->_titleLabel.mas_bottom);
        make.height.offset(30);
    }];
}

#pragma mark lazy load
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = ({
            UIImageView *view = [[UIImageView alloc] init];
            view.contentMode = UIViewContentModeScaleAspectFit;
            view.clipsToBounds = YES;
            view;
        });
    }
    return _iconView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGB(66, 66, 66);
            label.font = FONT(15);
            label;
        });
    }
    return _titleLabel;
}
- (UILabel *)secondTitleLabel {
    if (!_secondTitleLabel) {
        _secondTitleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGB(99, 99, 99);
            label.font = FONT(14);
            label;
        });
    }
    return _secondTitleLabel;
}

#pragma mark setup
- (void)setEmptyType:(EmptyType)emptyType {
    _emptyType = emptyType;
    
    CGRect rect = CGRectZero;
    if (_emptyType == EmptyType_Full) {
        rect = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    }
    else if (_emptyType == EmptyType_NoNav) {
        rect = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-STATUS_HEIGHT-NAV_HEIGHT);
    }
    else if (_emptyType == EmptyType_NoTab) {
        rect = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-TAB_HEIGHT);
    }
    else if (_emptyType == EmptyType_NoNavAndTab) {
        rect = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-STATUS_HEIGHT-NAV_HEIGHT-TAB_HEIGHT);
    }
    
    [self updateEmptyViewFrame:rect];
}

- (void)updateEmptyViewFrame:(CGRect)newFrame {
    
    if (newFrame.size.width == CGRectZero.size.width || newFrame.size.height == CGRectZero.size.height) {
        return;
    }
    self.frame = newFrame;
}

@end
