//
//  JNRestApi.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNRestApi.h"
#import <AFNetworking.h>
#import "JNURLUtil.h"
#import <AdSupport/AdSupport.h>
#import "NSString+MD5.h"

static NSTimeInterval kNetworkTimeout = 10;

@interface JNRestApi ()
{
    NSString *_url;  //路径
    HttpMethods _httpMethod;    //请求方式
    
    BOOL _isCancel;     //是否取消
}

@property (nonatomic,strong)AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation JNRestApi

- (id)initWithURL:(NSString *)url httpMethods:(HttpMethods)httpMethod{
    if (self = [super init]) {
        _url = url;
        _httpMethod = httpMethod;
        
        _isCancel = NO;
    }
    return self;
}

- (void)raiseException:(NSString *)exception{
    [NSException raise:exception format:@"Exception"];
}

- (void)call{
    [self callWithTimeout:kNetworkTimeout async:nil];
}

- (void)callWithTimeoutAndAsync:(NSTimeInterval) timeout async:(BlockJsonData)result{
    [self callWithTimeout:kNetworkTimeout async:result];
}

#pragma mark - 网络请求
- (void)callWithTimeout:(NSTimeInterval)timeout async:(BlockJsonData)block{
    if ([NSThread isMainThread]) {
        [self raiseException:@"主线程不允许同步调用"];
        return;
    }
    
    self.manager = [[AFHTTPSessionManager alloc] init];
    
    //设置header信息
    [self setRequestHeader];
    
    //设置超时时间
    //self.manager.requestSerializer.timeoutInterval = timeout;
    
    if (_httpMethod == HttpMethods_Get) {
        if (block) {
            _task = [self.manager GET:_url parameters:[self queryGetParameters] progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id obj = [self doHttpResonse:responseObject];
                block(obj);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self onError:error];
            }];
            [_task resume];
        }else{
            //NSCondition *condition = [[NSCondition alloc] init];
            _task = [self.manager GET:_url parameters:[self queryGetParameters] progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self doSuccess:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self doFailure:error];
            }];
            [_task resume];
        }
    }else if (_httpMethod == HttpMethods_Post){
        if (block) {
            _task = [self.manager POST:_url parameters:[self queryPostParameters] progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id obj = [self doHttpResonse:responseObject];
                block(obj);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self onError:error];
            }];
            [_task resume];
        }else{
            _task = [self.manager POST:_url parameters:[self queryPostParameters] progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self doSuccess:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self doFailure:error];
            }];
            [_task resume];
        }
    }
}

/* 设置header */
- (void)setRequestHeader{
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSMutableString *strParam = [[NSMutableString alloc] initWithCapacity:0];
    
    if (_httpMethod == HttpMethods_Get) {
        [param addEntriesFromDictionary:[self queryGetParameters]];
        
    }else{
        [param addEntriesFromDictionary:[self queryPostParameters]];
    }
    
    //手机系统类型 platform
    NSString *platform = @"ios";
    //手机品牌 brand
    NSString *brand = [self getBrand];
    //手机app版本 version
    NSString *version = [self getVerison];
    //设备号 device
    NSString *device = [self getDeviceId];
    //登录 token，只要有值所有接口必传此参数
    NSString *token = @"";
    //公钥串 pubkey
    NSString *pubKey = publicKey;
    //[self.manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"pubkey"];
    //时间戳 timestamp
    NSString *time = [self getSysTime];
    //NSString *timestamp = [self getTimeIntervalSince:time];
    
    [param setObject:platform forKey:@"platform"];
    [param setObject:brand forKey:@"brand"];
    [param setObject:version forKey:@"version"];
    [param setObject:device forKey:@"device"];
    [param setObject:token forKey:@"token"];
    [param setObject:pubKey forKey:@"pubkey"];
    [param setObject:time forKey:@"timestamp"];
    
    NSArray *keys = [[param allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *key in keys) {
        NSString *value = [param objectForKey:key];
        
        if (value != nil && ![value isEqualToString:@""]) {
            [strParam appendFormat:@"%@=%@&",key,value];
        }
    }
    
    //去掉最后一个&符号
    NSRange range = NSMakeRange(strParam.length-1, 1);
    [strParam deleteCharactersInRange:range];
    
    //签名值 sign
    NSString *tempSign = [NSString stringWithFormat:@"%@%@",strParam,privateKey];
    
    NSLog(@"param:%@",param);
    NSLog(@"strparam:%@",tempSign);
    
    //md5签名
    NSString *sign =[[tempSign MD5Digest] uppercaseString];
    
    NSLog(@"sign:%@",sign);
    
    [param setObject:sign forKey:@"sign"];
    
    //设置请求头
    for (NSString *key in [param allKeys]) {
        NSString *value = [param objectForKey:key];
        
        [self.manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
 
}

- (void)cancel {
    if (!_isCancel) {
        
        [_task cancel];
        _isCancel = YES;
    }
}

- (void)doFailure:(NSError *)error {
    
    if ([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorCancelled) {
        // 取消
        [self onCancelled];
    } else if ([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorTimedOut) {
        // 超时
        [self onTimeout];
    } else {
        // 其他错误
        [self onError:error];
    }
}

- (void)doSuccess:(id)responseObject {
    
    [self onSuccessed];
}

- (void)onSuccessed {
    
    // TODO:成功日志
    NSLog(@"rest success");
}

- (void)onFailed {
    // TODO:失败日志
}
- (void)onCancelled {
    // TODO:取消日志
}
- (void)onTimeout {
    // TODO: 超时日志
}
- (void)onError:(NSError *)error {
    // TODO: 错误日志
}

- (NSDictionary *)queryPostParameters { return nil; }
- (NSDictionary *)queryGetParameters { return nil; }
- (id)doHttpResonse:(id)responseObject{ return nil; }

#pragma mark 公用方法

/**
 获取手机型号

 */
- (NSString *)getBrand{
    return [JNURLUtil iphoneType];
}

/**
 获取时间戳
 
 @return 返回时间戳
 */
- (NSString*)getTimeIntervalSince:(NSString*)time
{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyyMMddHHmmss"];
    NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [dateformatter setTimeZone:timezone];
    NSDate *date = [dateformatter dateFromString:time];
    
    //NSString *date2 = [dateformatter stringFromDate:date];
    // 时间戳转时间
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]];
    NSString *confromTimespStr = [dateformatter stringFromDate:confromTimesp];
    JNLOGDebug(@"时间戳转时间   = %@",confromTimespStr);
    NSString *date2 = [NSString stringWithFormat:@"%lld", (long long)[confromTimesp timeIntervalSince1970]*1000];
    
    return date2;
}

/**
 获取版本号
 
 @return 返回版本号
 */
- (NSString *)getVerison
{
    NSString *verison = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return verison;
}

/**
 获取设备标识符
 */
- (NSString *)getDeviceId{
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adId;
}

/**
 获取系统时间
 
 @return 返回系统时间
 */
- (NSString*)getSysTime
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    
    //NSTimeZone *zone2 = [NSTimeZone localTimeZone];
    
    NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    //[formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    [formatter setTimeZone:timezone];
    
    NSString *dateTime = [formatter stringFromDate:date];
    
    return dateTime;
}

#pragma mark lazy
- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _manager;
}

- (void)dealloc{
    [self cancel];
}

@end
