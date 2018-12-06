//
//  JNResetLoginPassword.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/5.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNResetLoginPassword.h"

@interface JNResetLoginPassword (){
    NSString *_mobile;
    NSString *_password;
    NSString *_type;
    
    NSString *_token;
}

@end

@implementation JNResetLoginPassword

- (instancetype)initWithMobile:(NSString *)mobile password:(NSString *)password type:(NSString *)type
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"account/resetLoginPassword"] httpMethods:HttpMethods_Post];
    if (self) {
        _mobile = mobile;
        _password = password;
        _type = type;
    }
    return self;
}


- (BOOL)parseResponseJson:(NSDictionary *)json{
    _token = json[@"data"][@"token"];
    return YES;
}

- (id)queryObjData{
    return _token;
}

- (id)queryPostParameters{
    return @{
             @"mobile":_mobile,
             @"password":_password,
             @"type":_type
             };
}


-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"resetLoginPassword";
}

@end
