//
//  JNURLHelper.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNURLHelper : NSObject
//实例
+ (instancetype)getInstance;

//获取api地址
- (NSString *)restApiURL:(NSString *)relativeURL;

//获取图片地址
- (NSString *)imageURl;
@end

NS_ASSUME_NONNULL_END
