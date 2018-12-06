//
//  JNLoginByMobile.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseRestApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNLoginByMobile : JNBaseRestApi

@property (nonatomic,copy)NSString *token;

- (instancetype)initWithMobile:(NSString *)mobile andPwd:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
