//
//  BlockMacro_h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/18.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef BlockMacro_h
#define BlockMacro_h

typedef void(^BlockHttpData)(id respose, NSError *error);
typedef void(^BlockJsonData)(id data);
typedef void(^BlockCompletion)(BOOL flag, NSError *error);

typedef void(^BlockTableSection)(NSInteger section, NSInteger row);

typedef void(^BlockItem)(NSInteger index);
typedef void(^BlockResult) (BOOL flag);


#endif /* BlockMacro_h */
