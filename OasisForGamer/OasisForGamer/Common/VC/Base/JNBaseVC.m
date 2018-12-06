//
//  JNBaseVC.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNBaseVC.h"

#import "SVProgressHUD.h"
#import "JNEmptyView.h"

@interface JNBaseVC ()

@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) JNBaseNavView *navView;
@property (nonatomic, strong) JNEmptyView *emptyView;

@end

@implementation JNBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _leftTitle = @"";
    _rightTitle = @"";
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_isHideNav) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
    else {
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_isShowEmptyView) {
        [_emptyView removeFromSuperview];
        _emptyView=nil;
    }
}

- (void)setupUI {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //self.navigationController.navigationBar.translucent = NO;
}

- (void)setupLayout{}

#pragma mark - lazy
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [btn setTitle:_leftTitle forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            [btn.titleLabel setFont:FONT_TEXT_SMALL];
            btn;
        });
    }
    return _leftBtn;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [btn setTitle:_rightTitle forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
            [btn.titleLabel setFont:FONT_TEXT_SMALL];
            btn;
        });
    }
    return _rightBtn;
}

- (JNBaseNavView *)navView {
    if (!_navView) {
        _navView = ({
            JNBaseNavView *view = [[JNBaseNavView alloc] init];
            view.leftIcon = _leftImage;
            view.title = self.title;
            view.titleColor = [UIColor whiteColor];
            view.rightIcon = _rightImage;
            view.backgroundColor = Color_Nav;
            view;
        });
    }
    return _navView;
}
- (JNEmptyView *)emptyView {
    if (!_emptyView) {
        _emptyView = ({
            JNEmptyView *view = [[JNEmptyView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-STATUS_HEIGHT-NAV_HEIGHT-TAB_HEIGHT)];
            view.backgroundColor = [UIColor whiteColor];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshEvent:)];
            [view addGestureRecognizer:tap];
            view;
        });
    }
    return _emptyView;
}

- (void)setIsSetCustomNav:(BOOL)isSetCustomNav {
    _isSetCustomNav = isSetCustomNav;
    
    if (_isHideNav && isSetCustomNav) {
        if (_baseNavView) {
            _navView = _baseNavView;
            [self.view addSubview:_baseNavView];
        }
        else {
            [self.view addSubview:self.navView];
        }
    }
}

#pragma mark - target
- (void)goBack {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)goNext {
    [self.view endEditing:YES];
}

- (void)refreshEvent:(UIGestureRecognizer *)gesture {
    [self baseEmptyRefresh];
}

- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    [_leftBtn setTitle:_leftTitle forState:UIControlStateNormal];
}
- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    [_rightBtn setTitle:_rightTitle forState:UIControlStateNormal];
}
- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    [_leftBtn setImage:_leftImage forState:UIControlStateNormal];
}
- (void)setRightImage:(UIImage *)rightImage {
    _rightImage = rightImage;
    [_rightBtn setImage:_rightImage forState:UIControlStateNormal];
}

#pragma mark - SVProgressHUD
- (void)showLoadingHUD {
    [self showLoadingHUD:@"正在加载"];
}
- (void)showLoadingHUD:(NSString *)status {
    [self settingSVProgressHUD];
    [SVProgressHUD showWithStatus:status];
}

- (void)showGifLoadingHUD{
    //暂无
}

- (void)hideLoadingHUD {
    [SVProgressHUD dismiss];
}
- (void)showInfoMessage:(NSString *)msg {
    [self settingSVProgressHUD];
    [SVProgressHUD showInfoWithStatus:msg];
}
- (void)showErrorMessage:(NSString *)msg {
    [self settingSVProgressHUD];
    [SVProgressHUD showErrorWithStatus:msg];
}
- (void)showSuccessMessage:(NSString *)msg {
    [self settingSVProgressHUD];
    [SVProgressHUD showSuccessWithStatus:msg];
}

- (void)settingSVProgressHUD {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
}


- (void)setIsShowEmptyView:(BOOL)isShowEmptyView {
    _isShowEmptyView = isShowEmptyView;
    
    if (isShowEmptyView) {
        [self.view addSubview:self.emptyView];
        self.emptyView.emptyImage = [self baseEmptyImage];
        self.emptyView.emptyTitle = [self baseEmptyTitle];
        self.emptyView.emptySecondTitle = [self baseEmptySecondTitle];
        self.emptyView.emptyType = EmptyType_NoNavAndTab;
        [self.emptyView updateEmptyViewFrame:[self baseEmptyViewFrame]];
    }
    else {
        if (_emptyView) {
            [_emptyView removeFromSuperview];
            _emptyView = nil;
        }
    }
}

#pragma mark - 空页面提示：有子类提供数据
- (UIImage *)baseEmptyImage {return [UIImage imageNamed:@"app_emptyView"];}
- (NSString *)baseEmptyTitle {return @"暂无内容";}
- (NSString *)baseEmptySecondTitle {return @"";}
- (CGRect)baseEmptyViewFrame {return CGRectZero;}
- (void)baseEmptyRefresh {}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
