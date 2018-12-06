//
//  JNAppPreference.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNAppPreference.h"

@implementation JNAppPreference

+ (instancetype)sharedInstance {
    static JNAppPreference *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[JNAppPreference alloc] init];
    });
    return _instance;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)phone {
    return [self getStringForKey:@"AppPhone" defaultValue:@""];
}
- (void)setPhone:(NSString *)phone {
    [self setStringForKey:@"AppPhone" value:phone];
}
- (NSString *)account {
    return [self getStringForKey:@"AppAccount" defaultValue:@""];
}
- (void)setAccount:(NSString *)account {
    [self setStringForKey:@"AppAccount" value:account];
}

- (NSString *)password {
    return [self getStringForKey:@"AppPassword" defaultValue:@""];
}
- (void)setPassword:(NSString *)password {
    [self setStringForKey:@"AppPassword" value:password];
}

- (NSString *)deviceToken {
    return [self getStringForKey:@"DeviceToken" defaultValue:@""];
}
- (void)setDeviceToken:(NSString *)deviceToken {
    [self setStringForKey:@"DeviceToken" value:deviceToken];
}


- (BOOL)isFirstOpen {
    return [self getBOOLForKey:@"AppIsFirstOpen" defalutValue:YES];
}
- (void)setIsFirstOpen:(BOOL)isFirstOpen {
    [self setBOOLForKey:@"AppIsFirstOpen" value:isFirstOpen];
}

- (BOOL)isLoginSuccess {
    return [self getBOOLForKey:@"AppIsLoginSuccess" defalutValue:NO];
}
- (void)setIsLoginSuccess:(BOOL)isLoginSuccess {
    [self setBOOLForKey:@"AppIsLoginSuccess" value:isLoginSuccess];
}
- (BOOL)isFirstEnterExam {
    return [self getBOOLForKey:@"AppIsFirstEnterExam" defalutValue:YES];
}
- (void)setIsFirstEnterExam:(BOOL)isFirstEnterExam {
    [self setBOOLForKey:@"AppIsFirstEnterExam" value:isFirstEnterExam];
}

- (BOOL)isQuickRegister {
    return [self getBOOLForKey:@"AppIsQuickRegister" defalutValue:NO];
}
- (void)setIsQuickRegister:(BOOL)isQuickRegister {
    [self setBOOLForKey:@"AppIsQuickRegister" value:isQuickRegister];
}


#pragma mark - NSUserDefaults

- (NSString *)getStringForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    id b = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (b == nil) {
        return defaultValue;
    }
    return b;
}
- (void)setStringForKey:(NSString *)key value:(NSString *)value {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)getBOOLForKey:(NSString *)key defalutValue:(BOOL)flag {
    id b = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (b == nil) {
        return flag;
    }
    
    if ([b isEqualToString:@"YES"]) {
        return YES;
    }
    else if ([b isEqualToString:@"NO"]) {
        return NO;
    }
    return flag;
}

- (void)setBOOLForKey:(NSString *)key value:(BOOL)flag {
    [[NSUserDefaults standardUserDefaults] setObject:(flag ? @"YES":@"NO") forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
