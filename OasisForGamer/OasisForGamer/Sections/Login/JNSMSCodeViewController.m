//
//  JNSMSCodeViewController.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/3.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNSMSCodeViewController.h"

#import "UIButton+CountDown.h"
#import "JNCodeTextView.h"

#import "JNResetLoginPasswordViewController.h"

#import "JNGetSMSCode.h"
#import "JNValidateSMSCode.h"

@interface JNSMSCodeViewController ()

@property (nonatomic,strong)JNCodeTextView *codeTextView;
@property (weak, nonatomic) IBOutlet UIButton *smsCodeButton;
@property (strong, nonatomic) UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UILabel *mobileLabel;
@property (weak, nonatomic) IBOutlet UIView *tempCodeView;

@property (nonatomic,copy)NSString *mobile;

@end

@implementation JNSMSCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mobile = [JNAppPreference sharedInstance].phone;
    
    self.mobileLabel.text = self.mobile;
    
    [self getSMSCode];
}

- (void)setupUI{
    //self.edgesForExtendedLayout=UIRectEdgeNone;
    //self.navigationController.navigationBar.translucent = NO;
    //NSLog(@"%@",NSStringFromCGRect(self.smsCodeButton.bounds));
    //短信验证码按钮
    _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _codeButton.frame = self.smsCodeButton.bounds;
    _codeButton.backgroundColor = [UIColor clearColor];
    [_codeButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _codeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.smsCodeButton addSubview:_codeButton];
    
    
    //密码框
    [self.tempCodeView addSubview:self.codeTextView];
    //self.codeTextView.frame = CGRectMake(40, 300, DEVICE_WIDTH-80.0, 50.0);
    self.codeTextView.frame = self.tempCodeView.bounds;
    
    [self.codeTextView showKeyboard];
    
    @weakifyBYB(self)
    self.codeTextView.endEditBlock = ^(NSString * _Nonnull str) {
        @strongifyBYB(self)
        
        JNValidateSMSCode *validate = [[JNValidateSMSCode alloc] initWithMobile:self.mobile type:self.status smsCode:str];
        
        [JNGCDUtil runInGlobalQueue:^{
            [validate callWithTimeout:10 async:^(id data) {
                [JNGCDUtil runInMainQueue:^{
                    if (validate.code > RestApi_OK) {
                        JNResetLoginPasswordViewController *vc = StoryBoard(@"Account", @"resetloginpassword");
                        vc.status = self.status;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                }];
            }];
        }];
    };
}

- (void)setupLayout{
    
}

- (void)getSMSCode{
    self.codeButton.time = 10;
    self.codeButton.format = @"%ld秒后重试";
    [self.codeButton startTimer];
    
    JNGetSMSCode *smscode = [[JNGetSMSCode alloc] initWithMobile:self.mobile andType:self.status];
    [JNGCDUtil runInGlobalQueue:^{
        [smscode call];
    }];
}

#pragma mark - 验证码输入框
- (JNCodeTextView *)codeTextView{
    if (!_codeTextView) {
        _codeTextView = [[JNCodeTextView alloc] initWithCount:6 margin:20];
    }
    return _codeTextView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)buttonAction:(id)sender {
    
    [self getSMSCode];
    
}
@end
