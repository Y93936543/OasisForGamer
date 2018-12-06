//
//  UIMacro_h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/18.
//  Copyright © 2018年 junion. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

// bounds
#define kScreenBounds [UIScreen mainScreen].bounds
// 屏幕宽度
#define DEVICE_WIDTH        ([[UIScreen mainScreen] bounds].size.width)
// 屏幕高度
#define DEVICE_HEIGHT       ([[UIScreen mainScreen] bounds].size.height)

//适配比例
#define DEVICE_Width_Scale  ([[UIScreen mainScreen] bounds].size.width)/375.0
#define DEVICE_Height_Scale ([[UIScreen mainScreen] bounds].size.height)/667.0

#define TAB_HEIGHT 49
#define NAV_HEIGHT 44
#define STATUS_HEIGHT 20

// 常用字体
#define FONT(fontsize)                [UIFont systemFontOfSize:fontsize]
#define FONT_BOLD(fontsize)           [UIFont boldSystemFontOfSize:fontsize]

// 粗体
#define FONT_H(fontsize)              [UIFont fontWithName:@"Helvetica" size:fontsize]
#define FONT_H_B(fontsize)            [UIFont fontWithName:@"Helvetica-Bold" size:fontsize]
// 微软雅黑
#define YC_YAHEI_FONT(FONTSIZE) [UIFont fontWithName:@"MicrosoftYaHei" size:(FONTSIZE)]

// 字体大小
#define FONT_TEXT_BIG               FONT_H(19)        // A
#define FONT_TEXT_NORMAL            FONT_H(17)        // B
#define FONT_TEXT_SMALL             FONT_H(15)        // C
#define FONT_TEXT_SMALL2            FONT_H(13)        // D
#define FONT_TEXT_SMALL3            FONT_H(11)        // E
#define FONT_TEXT_SMALL4            FONT_H(9)         // F

// App 配置
#define Color_Nav                   RGB(0,123,252)
#define Color_Tab                   RGB(240,240,240)
#define Color_AppBackground         RGB(235, 236, 237)

// 颜色转换
#define Color_Alert_BackgroundLayer [UIColor colorWithWhite:.5f alpha:0.5f]

#define RGB(Red,Green,Blue)         [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:1.0]
#define RGBA(Red,Green,Blue,Alpha)  [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:Alpha]
// 随机颜色
#define MSRANDOMCOLOR RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)

// 将十六进制转换为UIColor（如：0xff00ff）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* UIMacro_h */
