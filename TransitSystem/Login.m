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
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 60, 40)];
    [userNameLabel setBackgroundColor:[UIColor clearColor]];
    [userNameLabel setFont:[UIFont systemFontOfSize:16]];
    [userNameLabel setText:@"NAME:"];
    userNameLabel.tag = USERNAMELABEL;
    [self.view addSubview:userNameLabel];
    
    UITextField *userNameTextView = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 180, 40)];
    [userNameTextView setBackgroundColor:[UIColor whiteColor]];
    [userNameTextView setFont:[UIFont systemFontOfSize:20]];
    [userNameTextView setText:@"Your name"];
    userNameTextView.tag = USERNAMETEXTVIEW;
    userNameTextView.clearsOnBeginEditing = YES;
    [self.view addSubview:userNameTextView];
    
    UILabel *userPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, 60, 40)];
    [userPasswordLabel setBackgroundColor:[UIColor clearColor]];
    [userPasswordLabel setFont:[UIFont systemFontOfSize:16]];
    [userPasswordLabel setText:@"PAWD:"];
    userPasswordLabel.tag = USERPASSWORDLABEL;
    [self.view addSubview:userPasswordLabel];
    
    UITextField *userPasswordTextView = [[UITextField alloc] initWithFrame:CGRectMake(100, 230, 180, 40)];
    [userPasswordTextView setBackgroundColor:[UIColor whiteColor]];
    [userPasswordTextView setFont:[UIFont systemFontOfSize:20]];
    [userPasswordTextView setText:@"Your password"];
    userPasswordTextView.tag = USERPASSWORDTEXTVIEW;
    userPasswordTextView.clearsOnBeginEditing = YES;
    [self.view addSubview:userPasswordTextView];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    self.view.backgroundColor = background;
    
}

- (void)dealloc {
    self.userName = nil;
    self.userPassword = nil;
}

@end
