//
//  AppMacro_h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/18.
//  Copyright © 2018年 junion. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define AppStatus_Product 1     // 正式环境
#define AppStatus_Develop 2     // 开发环境
#define AppStatus_Test    3     // 测试环境

// 设置发布版本
#define APP_STATUS        3

#if APP_STATUS == AppStatus_Product
// 线上环境
#define publicKey @""
#define privateKey @""

#elif APP_STATUS == AppStatus_Develop
// 开发环境
#define publicKey @""
#define privateKey @""

#else
// 测试环境
#define publicKey @"38ad6e536166214348bed44b067dbeda"
#define privateKey @"0daa0aadb3ae4d291d4022021e77fbc1"

#endif

#define is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IOS6_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0?YES:NO)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0?YES:NO)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0?YES:NO)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0?YES:NO)
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=10.0?YES:NO)
#define IOS11_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=11.0?YES:NO)
#define IOS12_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=12.0?YES:NO)

//判断是否是iPhone X
#define ISIPHONEX [UIScreen mainScreen].bounds.size.height >= 812.0

#define TOKEN @""

#endif /* AppMacro_h */
