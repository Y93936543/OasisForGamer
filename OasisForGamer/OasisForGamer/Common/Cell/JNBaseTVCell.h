//
//  JNBaseTVCell.h
//  OasisForGamer
//  自定义表格单元格基类
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JNBaseTVCell;

typedef void(^ClickEventBlock)(NSIndexPath *indexPath, JNBaseTVCell *cell);//点击事件

@interface JNBaseTVCell : UITableViewCell

@property (nonatomic, weak) UITableView *tableView; //所属表格
@property (nonatomic, assign) BOOL showIndicator; //是否显示右侧按钮标识
@property (nonatomic, strong) ClickEventBlock click; //事件block

+ (CGFloat)classCellHeight; 

+ (instancetype)tcell:(UITableView *)tableView reuse:(BOOL)reuse;//

- (CGFloat)height;

- (void)setupUI;

- (void)scrollToActiveTextField;

#pragma mark - Subclass
- (void)setupSubViews;
- (void)setupLayout;

@end

NS_ASSUME_NONNULL_END
