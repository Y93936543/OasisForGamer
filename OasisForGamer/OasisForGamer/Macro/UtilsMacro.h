//
//  UtilsMacro_h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/18.
//  Copyright © 2018年 junion. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h


#define SharedApp ((AppDelegate*)[[UIApplication sharedApplication] delegate])

//通过storyboard获取控制器
#define StoryBoard(sbName,vcName) [[UIStoryboard storyboardWithName:sbName bundle:nil] instantiateViewControllerWithIdentifier:vcName]

#define kHarpyCurrentVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define UTF8(string) [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;


// 图片拉伸
#define IM_STRETCH_IMAGE(image, edgeInsets) ([image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch])

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define IMAGEfileURLWithPath(A) [[NSBundle mainBundle] pathForResource:A ofType:nil]
#define ImageNamed(name) [UIImage imageNamed:name]

// 日志处理
#ifdef DEBUG
#define JNLOGDebug(...) NSLog(__VA_ARGS__)
#else
#define JNLOGDebug(...) ((void)0)
#endif


#ifndef weakifyBYB
#if DEBUG
#if __has_feature(objc_arc)
#define weakifyBYB(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakifyBYB(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakifyBYB(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakifyBYB(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongifyBYB
#if DEBUG
#if __has_feature(objc_arc)
#define strongifyBYB(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongifyBYB(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongifyBYB(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongifyBYB(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* UtilsMacro_h */
