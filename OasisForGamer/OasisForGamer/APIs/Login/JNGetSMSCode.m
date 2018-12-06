//
//  JNGetSMSCode.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNGetSMSCode.h"

@interface JNGetSMSCode(){
    NSString *_mobile;
    NSString *_codeType;
}

@end

@implementation JNGetSMSCode

- (instancetype)initWithMobile:(NSString *)mobile andType:(NSString *)codeType
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"account/getSMSCode"] httpMethods:HttpMethods_Post];
    if (self) {
        _mobile = mobile;
        _codeType = codeType;
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
             @"codeType":_codeType
    };
}


-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"getSMSCode";
}

@end
