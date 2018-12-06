//
//  NSObject+Property.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)

// 自动化创建 sql 语句
- (NSString *)tableSql:(NSString *)tablename;
- (NSString *)insertSql:(NSString *)tablename;

// 属性列表
- (NSArray *)getPropertyList;

@end

NS_ASSUME_NONNULL_END
