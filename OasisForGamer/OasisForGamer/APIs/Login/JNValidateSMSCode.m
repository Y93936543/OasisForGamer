//
//  JNValidateSMSCode.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNValidateSMSCode.h"

@interface JNValidateSMSCode (){
    NSString *_mobile;
    NSString *_codeType;
    NSString *_smsCode;
}

@end

@implementation JNValidateSMSCode

- (instancetype)initWithMobile:(NSString *)mobile type:(NSString *)codeType smsCode:(NSString *)smsCode
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"account/validateSMSCode"] httpMethods:HttpMethods_Post];
    if (self) {
        _mobile = mobile;
        _codeType = codeType;
        _smsCode = smsCode;
    }
    return self;
}

- (BOOL)parseResponseJson:(NSDictionary *)json{
    return YES;
}

- (id)queryObjData{
    return nil;
}

- (id)queryPostParameters{
    return @{
             @"mobile":_mobile,
             @"codeType":_codeType,
             @"smsCode":_smsCode
             };
}


-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"validateSMSCode";
}

@end
