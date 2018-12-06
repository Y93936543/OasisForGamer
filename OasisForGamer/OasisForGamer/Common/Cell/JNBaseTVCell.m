//
//  JNBaseTVCell.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseTVCell.h"
#import "JNBaseTVCell.h"

@interface JNBaseTVCell (){
    BOOL _commonInit;
}
@property (nonatomic, strong) UIImageView *indicatorImgView;

@end

@implementation JNBaseTVCell

+ (CGFloat)classCellHeight {
    return 44.0;
}

+ (instancetype)tcell:(UITableView *)tableView reuse:(BOOL)reuse {
    
    JNBaseTVCell *cell = nil;
    if (reuse && tableView) {
        NSString *identifier = NSStringFromClass(self.class);
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    else {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.tableView = tableView;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    if (!_commonInit) {
        [self setupUI];
        _commonInit = YES;
    }
}

- (void)setupUI {
    [self.contentView addSubview:self.indicatorImgView];
    
    [self.indicatorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(25);
        make.right.offset(-10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
    
    [self setupSubViews];
}

- (UIImageView *)indicatorImgView {
    if (!_indicatorImgView) {
        _indicatorImgView = ({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            imgView.translatesAutoresizingMaskIntoConstraints = NO;
            imgView.image = [UIImage imageNamed:@"app_indicator"];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView;
        });
    }
    return _indicatorImgView;
}

- (void)setShowIndicator:(BOOL)showIndicator {
    _showIndicator = showIndicator;
    
    _indicatorImgView.hidden = !showIndicator;
}

- (void)scrollToActiveTextField {
//    if ([self.tableView isKindOfClass:TPKeyboardAvoidingTableView.class]) {
//        TPKeyboardAvoidingTableView *tv = (TPKeyboardAvoidingTableView *)self.tableView;
//        [tv scrollToActiveTextField];
//    }
}

- (CGFloat)height {
    return [self.class classCellHeight];
}

- (void)setupSubViews {}
- (void)setupLayout {}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
