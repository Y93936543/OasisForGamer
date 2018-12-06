//
//  JNLoginByMobile.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNLoginByMobile.h"

@interface JNLoginByMobile(){
    NSString *_mobile;
    NSString *_password;
}

@end

@implementation JNLoginByMobile

- (instancetype)initWithMobile:(NSString *)mobile andPwd:(nonnull NSString *)password
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"account/login"] httpMethods:HttpMethods_Post];
    if (self) {
        _mobile = mobile;
        _password = password;
    }
    return self;
}

- (BOOL)parseResponseJson:(NSDictionary *)json{
    _token = json[@"data"][@"token"];
    return YES;
}

- (id)queryObjData{
    return self.token;
}

- (id)queryPostParameters{
    return @{
             @"mobile":_mobile,
             @"password":_password
             };
}


-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"getMobileStatus";
}

@end
