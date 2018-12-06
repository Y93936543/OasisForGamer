//
//  JNResetLoginPassword.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseRestApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNResetLoginPassword : JNBaseRestApi

- (instancetype)initWithMobile:(NSString *)mobile password:(NSString *)password type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
