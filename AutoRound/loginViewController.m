//
//  loginViewController.m
//  AutoRound
//
//  Created by 力铭 刘 on 14-2-25.
//  Copyright (c) 2014年 CFA. All rights reserved.
//

#import "loginViewController.h"
#import "MBProgressHUD.h"

@interface loginViewController ()

@end

@implementation loginViewController {
    MBProgressHUD *HUD;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //UIColor* BlueColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    //UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    NSString* fontName = @"Optima-Regular";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    
#if 1
    //用户名 textfield 设置
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(64, 170, 440, 40)];
    self.usernameField.backgroundColor = [UIColor blackColor];
    self.usernameField.layer.cornerRadius = 2.0f;
    //self.usernameField.placeholder = @"用户名";
    self.usernameField.textColor = [UIColor whiteColor];
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameField.borderStyle = UITextBorderStyleBezel;
    self.usernameField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.usernameField.layer.borderWidth = 1.0;
    
    
    //UIImageView *imgv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"username.png"]];
    
    UIImageView *imgv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 20)];
    imgv1.image = [UIImage imageNamed:@"username.png"];
    imgv1.contentMode = UIViewContentModeScaleAspectFit;
    //imgv1
    
    //框内左侧留白
    //UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];

    self.usernameField.leftView = imgv1;
    self.usernameField.font = [UIFont fontWithName:fontName size:20.0f];

    //密码 textfield 设置
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(64, 220, 440, 40)];
    self.passwordField.backgroundColor = [UIColor blackColor];
    self.passwordField.layer.cornerRadius = 2.0f;
    //self.passwordField.placeholder = @"密码";
    self.usernameField.textColor = [UIColor whiteColor];
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordField.borderStyle = UITextBorderStyleBezel;
    self.passwordField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.passwordField.layer.borderWidth = 1.0;
    
    //UIImageView *imgv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    UIImageView *imgv2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 20)];
    imgv2.image = [UIImage imageNamed:@"password.png"];
    imgv2.contentMode = UIViewContentModeScaleAspectFit;
    
    //UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.passwordField.leftView = imgv2; //leftView2;
    self.passwordField.font = [UIFont fontWithName:fontName size:20.0f];

    //登录 button 设置
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(224, 270, 100, 40)];
    self.loginButton.backgroundColor = [UIColor blackColor];
    self.loginButton.layer.cornerRadius = 2.0f;
    self.loginButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    self.loginButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.loginButton.layer.borderWidth = 1.0;
    [self.loginButton setTitle:@"进入" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    //添加按钮点击响应事件
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];


    //添加到当前view
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];

    
    //设置密码框字符隐藏
    [_passwordField setSecureTextEntry:YES];
    
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
#endif
    //等待显示
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	HUD.labelText = @"登录中...";
    [self.view addSubview:HUD];
    
    //触摸屏幕使键盘消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
}

//触摸屏幕使键盘消失
-(void)dismissKeyboard {
    [self.view endEditing:YES];
    [self.passwordField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    // MBProgressHUD后台新建子线程执行任务
    [HUD showWhileExecuting:@selector(loginUser) onTarget:self withObject:nil animated:YES];
}

// 子线程中
-(void) loginUser {
    // 显示进度条
    sleep(3);
    
    // 返回主线程执行
    [self  performSelectorOnMainThread:@selector(goToMainView) withObject:nil waitUntilDone:FALSE];
}

// 服务器交互进行用户名，密码认证
-(BOOL)loginWithUsername:(NSString *)username Password:(NSString *)password {
    return true;
}

-(void) goToMainView {
    [self performSegueWithIdentifier:@"GoToMainViewSegue" sender:self];
}


#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)passwordField {
    [passwordField resignFirstResponder];
    return YES;
}

@end
