//
//  JNRestApi.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HttpMethods) {
    HttpMethods_Get = 1,
    HttpMethods_Post = 2,
    HttpMethods_Delete = 3,
    HttpMethods_Put = 4,
};

@interface JNRestApi : NSObject

/**
 *  接口请求
 *
 *  @param url        接口url
 *  @param httpMethod 请求方式
 *
 *  @return RestApi 实例对象
 */
- (id)initWithURL:(NSString *)url httpMethods:(HttpMethods)httpMethod;

//网络请求
- (void)call;
- (void)callWithTimeoutAndAsync:(NSTimeInterval) timeout async:(BlockJsonData)result;

/**
 *  异步执行
 *  @param timeout     请求超时时间
 *  @param block       回调(模型对象、数组对象)
 */
- (void)callWithTimeout:(NSTimeInterval)timeout
                  async:(BlockJsonData)block;

/* 取消 */
- (void)cancel;

/* 设置header */
- (void)setRequestHeader;

/* 成功回调-同步 */
- (void)doSuccess:(id)responseObject;

/* 成功回调-异步 */
- (id)doHttpResonse:(id)responseObject;

/* 异常处理*/
- (void)raiseException:(NSString*)exception;

/* GET方式参数 */
- (NSDictionary *)queryGetParameters;
/* POST方式参数 */
- (NSDictionary *)queryPostParameters;

/* 数据返回的处理 */
- (void)onSuccessed; //成功
- (void)onFailed;   //失败
- (void)onCancelled;    //取消
- (void)onTimeout;  //超时
- (void)onError:(NSError *)error; //错误

@end

NS_ASSUME_NONNULL_END
