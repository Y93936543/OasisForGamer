//
//  NSString+Utils.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utils)

/**
 *    @brief    获取社保GUID
 *
 *    @return NSString
 */
+ (NSString*)guid;

/**
 *    @brief    判断是否为空
 *
 *  @param string 字符串
 *
 *    @return bool
 */
+ (BOOL)isEmpty:(NSString*)string;

/**
 *    @brief    md5摘要算法
 *
 *    @return bool
 */
- (NSString*)md5;

/**
 *    @brief    去掉字符串左边空格
 *
 *    @return NSString
 */
- (NSString*)trimLeft;

/**
 *    @brief    去掉字符串右边空格
 *
 *
 *    @return NSString
 */
- (NSString*)trimRight;

/**
 *    @brief    获取string在字符串的下标
 *
 *  @param string 指定字符串
 *
 *    @return NSInteger 下标
 */
- (NSInteger)indexOf:(NSString*)string;


@end

NS_ASSUME_NONNULL_END
