//
//  JNBaseTC.h
//  OasisForGamer
//  自定义基类表格视图控制器
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseVC.h"


@interface JNBaseTC : JNBaseVC

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

