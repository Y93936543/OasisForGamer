//
//  JNGetMobileStatus.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/3.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseRestApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNGetMobileStatus : JNBaseRestApi

@property (nonatomic,copy)NSString *status;

- (instancetype)initWithMobile:(NSString *)mobile;

@end

NS_ASSUME_NONNULL_END
