//
//  JNGetMobileStatusViewController.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/3.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNGetMobileStatusViewController.h"

#import "JNGetMobileStatus.h"

#import "JNGCDUtil.h"

#import "JNSMSCodeViewController.h"
#import "JNLoginInViewController.h"

@interface JNGetMobileStatusViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;


- (IBAction)nextClick:(id)sender;

@end

@implementation JNGetMobileStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    
    [self hideLoadingHUD];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //self.navigationController.navigationBar.hidden = NO;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)setupUI{
    
    //self.navigationController.navigationBar.translucent = NO;
    
    self.nextButton.layer.cornerRadius = 5;
    
    [[JNCollectionNotify sharedInstance] addTexitFieldChangeObserver:self selector:@selector(mobileChange:)];
    
}

#pragma mark -mobileChange
- (void)mobileChange:(NSNotification *)notifi{
    UITextField *txt = notifi.object;
    
    if (txt.text.length>0) {
        self.nextButton.backgroundColor = [UIColor orangeColor];
        self.nextButton.enabled = YES;
        
    }else{
        self.nextButton.backgroundColor = [UIColor lightGrayColor];
        self.nextButton.enabled = NO;
    }
}


- (IBAction)nextClick:(id)sender {
    
    JNGetMobileStatus *task = [[JNGetMobileStatus alloc] initWithMobile:self.mobileTextFiled.text];
    
    
    [self showLoadingHUD];
    
    [JNGCDUtil runInGlobalQueue:^{
        [task callWithTimeout:10 async:^(id data) {
            NSLog(@"data:%@",data);
            
            //存储手机号码
            [[JNAppPreference sharedInstance] setPhone:self.mobileTextFiled.text];
            
            [JNGCDUtil runInMainQueue:^{
                
                
                //self.mobileTextFiled.text = task.status;
                
                //task.status = @"222";
                
                if ([task.status isEqualToString:@"221"]) {
                    JNSMSCodeViewController *vc = StoryBoard(@"Account", @"smscode");
                    vc.status = @"1";
                    
                    [self.navigationController pushViewController:vc animated:YES];
                }else if ([task.status isEqualToString:@"222"]){
                    UIViewController *vc = StoryBoard(@"Account", @"loginin");
                    
                    [self.navigationController pushViewController:vc animated:YES];
                }else{
                    [self showErrorMessage:@"错误的操作！"];
                }
                
            }];
            
        }];
        
    }];
}

- (void)dealloc{
    [[JNCollectionNotify sharedInstance] removeTexitFieldChangeObserver:self];
}

@end
