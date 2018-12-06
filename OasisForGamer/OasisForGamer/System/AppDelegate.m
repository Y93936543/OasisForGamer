//
//  AppDelegate.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/17.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"

#import "JNTest_post.h"
#import "JNGCDUtil.h"
#import <AFNetworking.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"height:%f",[UIScreen mainScreen].bounds.size.height);
    

    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    [self.window setRootViewController:tabBarControllerConfig.tabBarController];

    NSURL *url = [NSURL URLWithString:@"http://120.92.9.189:8182/mock/account/loginIn-error"];
    
    
//    NSURLSession *session=[NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"data:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//    }];
//    [task resume];
    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager GET:@"http://120.92.9.189:8182/mock/account/loginIn-error" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"resonse:%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error:%@",error);
//    }];
    
    [JNGCDUtil runInGlobalQueue:^{

        JNTest_post *test = [[JNTest_post alloc] init];

        [test call];


        [JNGCDUtil runInMainQueue:^{
            


        }];
    }];
    
    
    
    //CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    //[self.window setRootViewController:tabBarControllerConfig.tabBarController];
    
//    UIViewController *login = StoryBoard(@"Account",@"getmobilestatus");
//    self.window.rootViewController = login;
//    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
