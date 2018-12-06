//
//  JNValidateSMSCode.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseRestApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNValidateSMSCode : JNBaseRestApi

- (instancetype)initWithMobile:(NSString *)mobile type:(NSString *)codeType smsCode:(NSString *)smsCode;

@end

NS_ASSUME_NONNULL_END
