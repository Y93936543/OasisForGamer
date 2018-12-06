//
//  JNURLHelper.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNURLHelper.h"

@implementation JNURLHelper

- (NSString *)baseURL {
    
#if APP_STATUS == AppStatus_Product
    return @"";       // 线上环境
    
#elif APP_STATUS == AppStatus_Develop
    return @"";     // 开发环境
    
#else
    return @"http://120.92.9.189:8182/mock";     // 测试环境
    
#endif
}

#pragma mark - 图片路径
- (NSString *)imageURl {
    return [NSString stringWithFormat:@"%@/resource/",[self baseURL]];
}

+ (instancetype)getInstance {
    static JNURLHelper *_instance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[JNURLHelper alloc] init];
    });
    return _instance;
}

- (NSString *)restApiURL:(NSString *)relativeURL {
    return [NSString stringWithFormat:@"%@/%@",[self baseURL],relativeURL];
}
@end
