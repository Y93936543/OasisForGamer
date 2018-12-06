//
//  JNModularACell.m
//  OasisForGamer
//
//  Created by 黄宏盛 on 2018/12/6.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNModularACell.h"
#import "JNModularA.h"

@interface JNModularACell()

@property (nonatomic, strong) NSArray *data;

@end

@implementation JNModularACell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray*)data
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子视图
        _data = data;
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    JNModularA *modularA = [[JNModularA alloc] initWithFrame:CGRectMake(10, 10, DEVICE_WIDTH, 150) data:_data];
    modularA.userInteractionEnabled = YES;
    modularA.selectedBlock = ^(NSInteger _id, NSInteger index) {
        //index为1、2、3
        if (self.selectedBlock) {
            self.selectedBlock(_id, index);
        }
    };
    [self addSubview:modularA];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
