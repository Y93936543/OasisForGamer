//
//  JNBarChartView.h
//  OasisForGamer
//  图表集成视图
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseView.h"

NS_ASSUME_NONNULL_BEGIN



@interface JNBarChartView : JNBaseView

@property (nonatomic,assign)BlockItem detailItemBlock;

//- (instancetype)initWithFrame:(CGRect)frame;

- (void)reloadData:(NSDictionary*)data;

@end

NS_ASSUME_NONNULL_END
