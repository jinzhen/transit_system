//
//  Login.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "Login.h"

#define SYSTEMINFOTEXTVIEW_TAG 111111
#define USERNAMELABEL 111112
#define USERPASSWORDLABEL 111113
#define USERNAMETEXTVIEW 111114
#define USERPASSWORDTEXTVIEW 111115

#define LOGIN_BUTTON_TAG 111116

@implementation Login
@synthesize userName = _userName;
@synthesize userPassword = _userPassword;

- (id)init {
    if (self = [super init]) {
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    [scrollView setContentSize:CGSizeMake(320, 580)];
    scrollView.showsVerticalScrollIndicator = NO;
    

    UILabel *systemInfoTextView = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
    [systemInfoTextView setBackgroundColor:[UIColor clearColor]];
    [systemInfoTextView setText:@"Welcome to transit system. We will provide you with perfect service."];
    [systemInfoTextView setFont:[UIFont systemFontOfSize:18]];
    systemInfoTextView.numberOfLines = 0;
    systemInfoTextView.tag = SYSTEMINFOTEXTVIEW_TAG;
    [scrollView addSubview:systemInfoTextView];
    
    UITextField *userNameTextView = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 240, 40)];
    [userNameTextView setBackgroundColor:[UIColor grayColor]];
    [userNameTextView setFont:[UIFont systemFontOfSize:20]];
    [userNameTextView setText:@"Your name"];
    userNameTextView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userNameTextView.clearButtonMode = UITextFieldViewModeUnlessEditing;
    userNameTextView.borderStyle=UITextBorderStyleRoundedRect;
    userNameTextView.tag = USERNAMETEXTVIEW;
    userNameTextView.clearsOnBeginEditing = YES;
    [scrollView addSubview:userNameTextView];
    
    UITextField *userPasswordTextView = [[UITextField alloc] initWithFrame:CGRectMake(40, 180, 240, 40)];
    [userPasswordTextView setBackgroundColor:[UIColor grayColor]];
    [userPasswordTextView setFont:[UIFont systemFontOfSize:20]];
    [userPasswordTextView setText:@"Your password"];
    userPasswordTextView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPasswordTextView.clearButtonMode = UITextFieldViewModeUnlessEditing;
    userPasswordTextView.borderStyle=UITextBorderStyleRoundedRect;
    userPasswordTextView.tag = USERPASSWORDTEXTVIEW;
    userPasswordTextView.clearsOnBeginEditing = YES;
    [scrollView addSubview:userPasswordTextView];
    
    
    UIImage* bgImageNormal=[[UIImage imageNamed:@"login_normal.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:12];
    UIImage* bgImagePress=[[UIImage imageNamed:@"login_press.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:12];

    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 300, 240, 40)];
    [loginButton setBackgroundImage: bgImageNormal forState:UIControlStateNormal];
    [loginButton setBackgroundImage: bgImagePress forState:UIControlStateHighlighted];
    [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    loginButton.tag = LOGIN_BUTTON_TAG;
    [loginButton addTarget:self action:@selector(handleLogin) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:loginButton];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapRecoginizer:)];
    [scrollView addGestureRecognizer:tap];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    self.view.backgroundColor = background;
    [self.view addSubview:scrollView];
}

- (void)handleTapRecoginizer:(UITapGestureRecognizer *)tap {
    [self hidenKeyBoard];
    
    UITextField *name = (UITextField *)[self.view viewWithTag:USERNAMETEXTVIEW];
    UITextField *password = (UITextField *)[self.view viewWithTag:USERPASSWORDTEXTVIEW];
    if ([name.text isEqualToString:@""]) {
        [name setText:@"Your name"];
    }else {
        if ([name.text isEqualToString:@"Your name"]) {
            name.clearsOnBeginEditing = YES;
        } else {
            name.clearsOnBeginEditing = NO;
        }
    }
    
    if ([password.text isEqualToString:@""]) {
        [password setText:@"Your password"];
    }else {
        if ([password.text isEqualToString:@"Your password"]) {
            password.clearsOnBeginEditing = YES;
        }else {
            password.clearsOnBeginEditing = NO;
        }
       
    }
}

- (void)handleLogin {
    [self hidenKeyBoard];
    
}

- (void)hidenKeyBoard {
    UITextField *name = (UITextField *)[self.view viewWithTag:USERNAMETEXTVIEW];
    UITextField *password = (UITextField *)[self.view viewWithTag:USERPASSWORDTEXTVIEW];
    
    [name resignFirstResponder];
    [password resignFirstResponder];
}

- (void)dealloc {
    self.userName = nil;
    self.userPassword = nil;
}

@end
