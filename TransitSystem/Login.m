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

- (void)setNavigationBarWithTitle:(NSString *)title {
    self.navigationController.title = title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarWithTitle:@"Login"];
    UILabel *systemInfoTextView = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
    [systemInfoTextView setBackgroundColor:[UIColor clearColor]];
    [systemInfoTextView setText:@"Welcome to transit system. We will provide you with perfect service."];
    [systemInfoTextView setFont:[UIFont systemFontOfSize:18]];
    systemInfoTextView.numberOfLines = 0;
    systemInfoTextView.tag = SYSTEMINFOTEXTVIEW_TAG;
    [self.view addSubview:systemInfoTextView];
    
    UITextField *userNameTextView = [[UITextField alloc] initWithFrame:CGRectMake(40, 150, 240, 40)];
    [userNameTextView setBackgroundColor:[UIColor whiteColor]];
    [userNameTextView setFont:[UIFont systemFontOfSize:20]];
    [userNameTextView setText:@"Your name"];
    userNameTextView.tag = USERNAMETEXTVIEW;
    userNameTextView.clearsOnBeginEditing = YES;
    [self.view addSubview:userNameTextView];
    
    UITextField *userPasswordTextView = [[UITextField alloc] initWithFrame:CGRectMake(40, 210, 240, 40)];
    [userPasswordTextView setBackgroundColor:[UIColor whiteColor]];
    [userPasswordTextView setFont:[UIFont systemFontOfSize:20]];
    [userPasswordTextView setText:@"Your password"];
    userPasswordTextView.tag = USERPASSWORDTEXTVIEW;
    userPasswordTextView.clearsOnBeginEditing = YES;
    [self.view addSubview:userPasswordTextView];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 300, 240, 40)];
    [loginButton setBackgroundImage: [UIImage imageNamed:@"login_normal"] forState:UIControlStateNormal];
    [loginButton setBackgroundImage: [UIImage imageNamed:@"login_press"] forState:UIControlStateHighlighted];
    [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    loginButton.tag = LOGIN_BUTTON_TAG;
    [self.view addSubview:loginButton];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    self.view.backgroundColor = background;
    
}

- (void)handleTapRecoginizer {
//    [self.view becomeFirstResponder];
}

- (void)dealloc {
    self.userName = nil;
    self.userPassword = nil;
}

@end
