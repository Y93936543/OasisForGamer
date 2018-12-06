//
//  JNTest_post.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/3.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNTest_post.h"

#import "JNURLHelper.h"

@implementation JNTest_post

- (instancetype)init
{
    self = [super initWithURL:[[JNURLHelper getInstance] restApiURL:@"mock/account/loginIn-error"] httpMethods:HttpMethods_Get];
    if (self) {
        
    }
    return self;
}

- (BOOL)parseResponseJson:(NSDictionary *)json{
    NSLog(@"json:%@",json);
    return YES;
}

- (id)queryObjData{
    return self.content;
}

- (id)queryPostParameters{
    return nil;
}

-(MockType)mockType{
    return MockNone;
}

- (NSString *)mockFile{
    return @"login";
}

@end
