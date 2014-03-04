//
//  loginViewController.h
//  AutoRound
//
//  Created by 力铭 刘 on 14-2-25.
//  Copyright (c) 2014年 CFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField * usernameField;

@property (nonatomic, strong) IBOutlet UITextField * passwordField;

@property (nonatomic, strong) IBOutlet UIButton *loginButton;

- (IBAction)login:(id)sender;

@end