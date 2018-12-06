//
//  JNFileManagerUtil.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNFileManagerUtil.h"

@implementation JNFileManagerUtil

//获取文件路径，创建所在目录
+ (void)createDir:(NSString*)filepath {
    filepath = filepath.stringByDeletingLastPathComponent;
    if (![[NSFileManager defaultManager] fileExistsAtPath:filepath])
    [[NSFileManager defaultManager] createDirectoryAtPath:filepath withIntermediateDirectories:YES attributes:nil error:nil];
}

///<>/Documents/config.plist
//程序设置信息
+ (NSString*)remotePreferenceFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString* filepath = [NSString stringWithFormat:@"%@/config.plist", [paths objectAtIndex:0]];
    
    [self createDir:filepath];
    
    return filepath;
}

///<>/Documents/Crash/crashLog.txt
// 错误日志
+ (NSString *)crashFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString* filepath = [NSString stringWithFormat:@"%@/Crash/crashLog.txt", [paths objectAtIndex:0]];
    
    [self createDir:filepath];
    
    return filepath;
}

///<>/Library/Caches/mobile.sqlite
// 程序数据库文件
+ (NSString *)fmdbFileWithMobile:(NSString *)mobile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString* filepath = [NSString stringWithFormat:@"%@/Caches/%@.sqlite", [paths objectAtIndex:0],mobile];
    
    [JNFileManagerUtil createDir:filepath];
    
    return filepath;
}

///<>/Documents/app.sqlite
// 数据库文件
+ (NSString *)fmdbFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* filepath = [NSString stringWithFormat:@"%@/app.sqlite", [paths objectAtIndex:0]];
    [JNFileManagerUtil createDir:filepath];
    return filepath;
}

///<>/Library/Preferences/Icons/phoneNumber.png
// 用户头像信息（自己头像，朋友头像）
+ (NSString *)userImageFileWithMobile:(NSString *)mobile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *filePath = [NSString stringWithFormat:@"%@/Preferences/Icons/%@.png",paths[0],mobile];
    [JNFileManagerUtil createDir:filePath];
    return filePath;
}

///<>/Library/Preferences/<Phonenumber>/user.plist
// 程序设置信息
+ (NSString*)userPreferenceFile:(NSString*)phoneNumber
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString* filepath = [NSString stringWithFormat:@"%@/Preferences/%@/user.plist", [paths objectAtIndex:0], phoneNumber];
    
    [JNFileManagerUtil createDir:filepath];
    
    return filepath;
}

@end
