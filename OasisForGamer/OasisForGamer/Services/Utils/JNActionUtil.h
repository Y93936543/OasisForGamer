//
//  JNActionUtil.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DismissAction)(NSInteger buttonIndex);

@interface JNActionUtil : NSObject
/**
 *  自定义 AlertView
 *
 *  @param title          标题
 *  @param message        内容
 *  @param actions        操作
 *  @param vc             呈现的控制器
 *  @param clickItemBlock 回调
 */
+ (void)showAlertTitle:(NSString *)title
               message:(NSString *)message
               actions:(NSArray *)actions
                    vc:(UIViewController *)vc
                 block:(DismissAction)clickItemBlock;

/**
 *  自定义 SheetView
 *
 *  @param title          标题
 *  @param actions        操作
 *  @param vc             呈现的控制器
 *  @param clickItemBlock 回调
 */
+ (void)showSheetTitle:(NSString *)title
               actions:(NSArray *)actions
                    vc:(UIViewController *)vc
                 block:(DismissAction)clickItemBlock;
@end

NS_ASSUME_NONNULL_END
