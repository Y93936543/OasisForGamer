//
//  JNBaseRestApi.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/11/30.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNRestApi.h"

NS_ASSUME_NONNULL_BEGIN

/*
 *  状态码
 */
typedef NS_ENUM(NSInteger, RestApiCode) {
    RestApi_OK = 0,                     // 成功
    RestApi_NoUserToken = -1,            // 无用户token信息 （请登录）
    RestApi_UnkownError = -2,         // 未知错误（系统出错）
    RestApi_InvalidJSON = -108,          // 解析 JSON 异常
};

/*
 *  本地mock
 */
typedef NS_ENUM(NSInteger, MockType) {
    MockNone,
    MockFile,
};

@interface JNBaseRestApi : JNRestApi

@property (nonatomic, assign) RestApiCode code;     // 状态码
@property (nonatomic, copy) NSString *msg;      // 状态提示
@property (nonatomic, assign) BOOL showMsg; // 是否显示提示

/* 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;

+ (NSString *)getRestApiURL:(NSString *)relativeURL;

/* 解析json数据*/
- (BOOL)parseResponseJson:(NSDictionary *)json;

/* 返回请求结果 */
- (id)queryObjData;

/* 参数，字典类型：GET,POST方法请求数据 */
- (id)queryGetParameters;
- (id)queryPostParameters;

#pragma mark - Mock
- (MockType)mockType;
- (NSString *)mockFile;

@end

NS_ASSUME_NONNULL_END
