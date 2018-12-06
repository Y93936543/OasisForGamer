//
//  JNModularHead.h
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/6.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MoreBtnBlock) (void);

@interface JNModularHead : UIView

//正标题
@property (nonatomic, strong) UILabel *title;
//副标题
@property (nonatomic, strong) UILabel *subtitle;
//更多
@property (nonatomic, strong) UILabel *moreBtn;

//点击更多回调
@property (nonatomic, strong) MoreBtnBlock moreBtnBlock;

@end

NS_ASSUME_NONNULL_END
