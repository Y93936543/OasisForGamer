//
//  JNResetLoginPasswordViewController.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/4.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNResetLoginPasswordViewController.h"

#import "NSString+JudgeString.h"

#import "JNResetLoginPassword.h"

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"

@interface JNResetLoginPasswordViewController (){
    NSString *_mobile;
}
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileLabel;
@property (weak, nonatomic) IBOutlet UILabel *pwd1TextLabel;
@property (weak, nonatomic) IBOutlet UILabel *pwd2TextLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *eyeButton;
@property (weak, nonatomic) IBOutlet UIButton *pwd1TextButton;
@property (weak, nonatomic) IBOutlet UIButton *pwd2TextButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

- (IBAction)commitClick:(id)sender;


@end

@implementation JNResetLoginPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)setupUI{
    _mobile = [JNAppPreference sharedInstance].phone;
    
    self.commitButton.layer.cornerRadius = 5;
    
    [[JNCollectionNotify sharedInstance] addTexitFieldChangeObserver:self selector:@selector(mobileChange:)];
    
    if ([self.status isEqualToString:@"2"]) {
        self.loginLabel.text = @"重置登录密码";
        self.mobileLabel.text = [NSString stringWithFormat:@"重置您账号(%@) 的登录密码",_mobile];
    }else{
        self.loginLabel.text = @"设置登录密码";
        self.mobileLabel.text = [NSString stringWithFormat:@"设置您账号(%@) 的登录密码",_mobile];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -mobileChange
- (void)mobileChange:(NSNotification *)notifi{
    UITextField *txt = notifi.object;
    
    BOOL pwd1Flag = NO;
    BOOL pwd2Flag = NO;
    
    if ([txt.text isValidPasswordString]) {
        pwd1Flag = YES;
        self.pwd1TextButton.hidden = YES;
    }else{
        self.pwd1TextButton.hidden = NO;
    }
    
    if ([txt.text length] >= 8 && [txt.text length] <= 16) {
        pwd2Flag = YES;
        self.pwd2TextButton.hidden = YES;
    }else{
        self.pwd2TextButton.hidden = NO;
    }
    
    if (pwd1Flag&&pwd2Flag) {
        self.commitButton.backgroundColor = [UIColor orangeColor];
        self.commitButton.enabled = YES;
        
    }else{
        self.commitButton.backgroundColor = [UIColor lightGrayColor];
        self.commitButton.enabled = NO;
    }
}

- (IBAction)commitClick:(id)sender {
    JNResetLoginPassword *resetlogin = [[JNResetLoginPassword alloc] initWithMobile:_mobile password:self.passwordTextField.text type:self.status];
    
    [self showLoadingHUD:@"密码设置中..."];
    [JNGCDUtil runInGlobalQueue:^{
        [resetlogin callWithTimeout:10 async:^(id data) {
            
            if (resetlogin.code > RestApi_OK) {
                [[JNAppPreference sharedInstance] setDeviceToken:data];
                
                CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
                
                [SharedApp.window setRootViewController:tabBarControllerConfig.tabBarController];
            }
        }];
    }];
}

- (void)dealloc{
    [[JNCollectionNotify sharedInstance] removeTexitFieldChangeObserver:self];
}


@end
