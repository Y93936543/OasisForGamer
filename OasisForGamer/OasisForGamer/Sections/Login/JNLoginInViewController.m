//
//  JNLoginInViewController.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/4.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNLoginInViewController.h"

#import "JNSMSCodeViewController.h"

#import "JNLoginByMobile.h"

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"

@interface JNLoginInViewController (){
    NSString *_mobile;
}

@property (weak, nonatomic) IBOutlet UILabel *mobileLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *eyeButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;
- (IBAction)eyeClick:(id)sender;
- (IBAction)forgetClick:(id)sender;
- (IBAction)commitClick:(id)sender;

@end

@implementation JNLoginInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    _mobile = [JNAppPreference sharedInstance].phone;
    
    self.mobileLabel.text = [NSString stringWithFormat:@"登录账号 %@",_mobile];
    
    self.navigationController.navigationBar.translucent = YES;
    
    self.commitButton.layer.cornerRadius = 5;
    
    [[JNCollectionNotify sharedInstance] addTexitFieldChangeObserver:self selector:@selector(mobileChange:)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -mobileChange
- (void)mobileChange:(NSNotification *)notifi{
    UITextField *txt = notifi.object;
    
    if (txt.text.length>0) {
        self.commitButton.backgroundColor = [UIColor orangeColor];
        self.commitButton.enabled = YES;
        
    }else{
        self.commitButton.backgroundColor = [UIColor lightGrayColor];
        self.commitButton.enabled = NO;
    }
}


- (IBAction)eyeClick:(id)sender {
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
}

- (IBAction)forgetClick:(id)sender {
    JNSMSCodeViewController *vc = StoryBoard(@"Account", @"smscode");
    vc.status = @"2";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)commitClick:(id)sender {
    JNLoginByMobile *login = [[JNLoginByMobile alloc] initWithMobile:_mobile andPwd:self.passwordTextField.text];
    
    [self showLoadingHUD:@"登录中..."];
    
    [JNGCDUtil runInGlobalQueue:^{
        [login callWithTimeout:10 async:^(id data) {
            [JNGCDUtil runInMainQueue:^{
                JNLOGDebug(@"token:%@",data);
                if (login.code > RestApi_OK) {
                    [[JNAppPreference sharedInstance] setDeviceToken:data];
                    
                    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
                    
                    [SharedApp.window setRootViewController:tabBarControllerConfig.tabBarController];
                }
            }];
        }];
        
    }];
}

- (void)dealloc{
    [[JNCollectionNotify sharedInstance] removeTexitFieldChangeObserver:self];
}

@end
