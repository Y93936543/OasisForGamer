//
//  JNGetMobileStatus.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/3.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNGetMobileStatus.h"

@interface JNGetMobileStatus (){
    NSString *_mobile;
}

@end

@implementation JNGetMobileStatus

- (instancetype)initWithMobile:(NSString *)mobile
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"account/getMobileStatus"] httpMethods:HttpMethods_Post];
    if (self) {
        _mobile = mobile;
    }
    return self;
}

- (BOOL)parseResponseJson:(NSDictionary *)json{
    _status = json[@"data"][@"status"];
    return YES;
}

- (id)queryObjData{
    return self.status;
}

- (id)queryPostParameters{
    return @{
             @"mobile":_mobile
    };
}


-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"getMobileStatus";
}


@end
