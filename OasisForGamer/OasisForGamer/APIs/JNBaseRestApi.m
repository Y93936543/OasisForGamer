//
//  JNBaseRestApi.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseRestApi.h"

#import "JNURLHelper.h"

#import "SVProgressHUD.h"

#import "JNGCDUtil.h"

@implementation JNBaseRestApi

+ (NSString *)getRestApiURL:(NSString *)relativeURL{
    return [[JNURLHelper getInstance] restApiURL:relativeURL];
}

- (NSDictionary *)queryGetParameters{
    return nil;
}

- (NSDictionary *)queryPostParameters{
    return nil;
}

- (void)callWithTimeout:(NSTimeInterval)timeout async:(BlockJsonData)block{
    if ([NSThread isMainThread]) {
        [self raiseException:@"主线程不允许同步调用"];
        return;
    }
    
    if ([self mockType] == MockNone) {
        [super callWithTimeout:timeout async:block];
    }
    else {
        /*
         * 模拟本地登录, 从本地 .json 文件中读取数据
         */
        sleep(1);
        @weakifyBYB(self)
        
        __block void(^simulateBlock)(void) = ^{
            
            @strongifyBYB(self)
            
            NSData *responseData = nil;
            
            NSString *mockFile = [self mockFile];
            if (mockFile) {
                NSString *filePath = [[NSBundle mainBundle] pathForResource:mockFile ofType:@"json"];
                responseData = [NSData dataWithContentsOfFile:filePath];
            }
            
            if (responseData == nil) {
                [self raiseException:@"应答数据不能为nil, responseData==nil"];
            }
            
            if (block) {
                id obj = [self doHttpResonse:responseData];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(obj);
                });
            }
            else {
                [self doSuccess:responseData];
            }
        };
        
        simulateBlock();
    }
}

- (void)doSuccess:(id)responseObject {
    @try {
//        NSError *error;
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *json = responseObject;
        self.code = [json[@"code"] integerValue];
        self.msg = json[@"msg"];
        self.showMsg = [json[@"showMsg"] boolValue];
        
        if (self.code > RestApi_OK && [self parseResponseJson:json]) {
            [self onSuccessed];
        }
        else {
            if (self.code > RestApi_OK) {
                
                [self onSuccessed];
            }
            else {
                [self onFailed];
            }
        }
        
    } @catch (NSException *exception) {
        //[self onError:nil];
    } @finally {
        
    }
}

- (id)doHttpResonse:(id)responseObject{
    [self doSuccess:responseObject];
    if (self.code > RestApi_OK) {
        return [self queryObjData];
    }
    return nil;
}

- (id)doHttpResonse:(id)responseObject
              error:(NSError *)error {
    [self doSuccess:responseObject];
    if (self.code > RestApi_OK) {
        return [self queryObjData];
    }
    return nil;
}

- (id)queryObjData {
    return self.dataSource;
}
- (BOOL)parseResponseJson:(NSDictionary *)json {
    return NO;
}

- (void)onSuccessed {
    //NSLog(@"baserest success");
    //[super onSuccessed];
    
    [JNGCDUtil runInMainQueue:^{
        if (self.code > RestApi_OK) {
            if (self.showMsg) {
                [SVProgressHUD showInfoWithStatus:self.msg];
            }
        }
    }];
    
}

- (void)onFailed {
    //[super onFailed];
    [JNGCDUtil runInMainQueue:^{
            if (self.code < RestApi_OK) {
                if (self.showMsg) {
                    [SVProgressHUD showInfoWithStatus:self.msg];
                }
            }
    }];
}

- (void)onTimeout {
    [super onTimeout];
}
- (void)onCancelled {
    [super onCancelled];
}
- (void)onError:(NSError *)error {
    
    self.code = RestApi_UnkownError;
    [super onError:error];
}

- (MockType)mockType {
    return MockNone;
}
- (NSString *)mockFile {
    return @"login";
}

@end
