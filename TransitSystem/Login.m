//
//  Login.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "Login.h"
#import "MapViewController.h"
#import "TSNavigationController.h"
#import "DataTransmission.h"
#import "AsyncSocket.h"
#import "TSCommon.h"
#import "TSSocketPacket.h"
#import "TSToast.h"

#define SYSTEMINFOTEXTVIEW_TAG 111111
#define USER_NAME_TEXTVIEW 111114
#define USER_PASSWORD_TEXTVIEW 111115

#define LOGIN_BUTTON_TAG 111116
#define REGISTER_BUTTON_TAG 111117
#define FORGET_PASSWORD_BUTTON_TAG 111118
#define SCROLL_VIEW 111119

@implementation Login
@synthesize userName = _userName;
@synthesize userPassword = _userPassword;

- (id)init {
    if (self = [super init]) {
        _socket = [[AsyncSocket alloc] initWithDelegate:self];
        isBeatting = YES;
        overRepeatTime = 0;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [TSNavigationController setNavigationBar:self title:@"TRANSIT SYS" leftBtnTitle:nil rightBtnTitle:nil leftBtnAction:nil rightBtnAction:nil];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    [scrollView setContentSize:CGSizeMake(320, 580)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.tag = SCROLL_VIEW;

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
    userNameTextView.tag = USER_NAME_TEXTVIEW;
    userNameTextView.clearsOnBeginEditing = YES;
    [scrollView addSubview:userNameTextView];
    
    UITextField *userPasswordTextView = [[UITextField alloc] initWithFrame:CGRectMake(40, 180, 240, 40)];
    [userPasswordTextView setBackgroundColor:[UIColor grayColor]];
    [userPasswordTextView setFont:[UIFont systemFontOfSize:20]];
    [userPasswordTextView setText:@"Your password"];
    userPasswordTextView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPasswordTextView.clearButtonMode = UITextFieldViewModeUnlessEditing;
    userPasswordTextView.borderStyle=UITextBorderStyleRoundedRect;
    userPasswordTextView.tag = USER_PASSWORD_TEXTVIEW;
    userPasswordTextView.clearsOnBeginEditing = YES;
    userPasswordTextView.delegate = self;
    [scrollView addSubview:userPasswordTextView];
    
    
    UIImage* registerImageNormal=[UIImage imageNamed:@"register_background_normal.png"];
    UIImage* registerImagePress=[UIImage imageNamed:@"register_background_press.png"];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 240, 80, 20)];
    [registerButton setBackgroundImage: registerImageNormal forState:UIControlStateNormal];
    [registerButton setBackgroundImage: registerImagePress forState:UIControlStateHighlighted];
    [registerButton setTitle:@"REGISTER" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    registerButton.tag = REGISTER_BUTTON_TAG;
    [registerButton addTarget:self action:@selector(handleRegister) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:registerButton];
    
    UIButton *forgetPasswordButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 240, 80, 20)];
    [forgetPasswordButton setBackgroundImage: registerImageNormal forState:UIControlStateNormal];
    [forgetPasswordButton setBackgroundImage: registerImagePress forState:UIControlStateHighlighted];
    [forgetPasswordButton setTitle:@"FORGET?" forState:UIControlStateNormal];
    [forgetPasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forgetPasswordButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    forgetPasswordButton.tag = REGISTER_BUTTON_TAG;
    [forgetPasswordButton addTarget:self action:@selector(handleForgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:forgetPasswordButton];

    
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
    
    UITextField *name = (UITextField *)[self.view viewWithTag:USER_NAME_TEXTVIEW];
    UITextField *password = (UITextField *)[self.view viewWithTag:USER_PASSWORD_TEXTVIEW];
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
        password.secureTextEntry = NO;
        [password setText:@"Your password"];
    }else {
        if ([password.text isEqualToString:@"Your password"]) {
            password.secureTextEntry = NO;
            password.clearsOnBeginEditing = YES;
        }else {
            password.secureTextEntry = YES;
            password.clearsOnBeginEditing = NO;
        }
    }
}

- (void)handleRegister {
    
}

- (void)handleForgetPassword {
    
}

- (BOOL)connectToHost {
    
    if ([_socket isConnected]) {
        return YES;
    }
    NSError *error = nil;
    if(![_socket connectToHost:@"127.0.0.1" onPort:8000 error:&error])
    {
        NSLog(@"Error: %@", error);
        return NO;
    }
    return YES;
}

- (void)sendHeartBeatBag {
    
    if (isBeatting) {
        [TSCommon sendDataToServerWith:_socket type:0 data:[[TSCommon getIPAddress] dataUsingEncoding:NSUTF8StringEncoding]];
        isBeatting = NO;
        overRepeatTime = 0;
        [TSCommon recvDataFromServerWith:_socket];
    }else {
        if (3 < overRepeatTime++ && overRepeatTime < 6) {
            [TSToast showWithText:@"The netword isn't connect!" duration:5.0f];
        }
    }
}

- (void)handleLogin {
    [self hidenKeyBoard];
    if (![self connectToHost]) {
        NSLog(@"Your netWord is disable!");
    }
    
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:SCROLL_VIEW];
    UITextField *userName = (UITextField *)[scrollView viewWithTag:USER_NAME_TEXTVIEW];
    UITextField *password = (UITextField *)[scrollView viewWithTag:USER_PASSWORD_TEXTVIEW];
    if (![userName.text isEqualToString:@""] && ![userName.text isEqualToString:@"Your name"]) {
        if (![password.text isEqualToString:@""] && ![password.text isEqualToString:@"Your password"]) {
            NSString *content = [NSString stringWithFormat:@"%@%@", userName.text, password.text];
            NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
            [TSCommon sendDataToServerWith:_socket type:1 data:data];
            [TSCommon recvDataFromServerWith:_socket];
        }else {
            [password setText:@"INCORRECT"];
        }
    }else {
        [userName setText:@"INCORRECT"];
    }
    
}


- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    if (8000 == port) {
        _time = [NSTimer scheduledTimerWithTimeInterval:10
                                                 target:self
                                               selector:@selector(sendHeartBeatBag)
                                               userInfo:nil
                                                repeats:YES];
    }
    
}
-(void) onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    if (!data) {
        return ;
    }
    
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", dataStr);
    
    if ([TSCommon isHeartBeatPacket:data]) {
        isBeatting = YES;
    }else if ([TSCommon isUserInformation:data]) {
        MapViewController *map = [[MapViewController alloc] init];
        [self.navigationController pushViewController:map animated:YES];
    }else {
        //other data.
    }
}

- (void)onSocket:(AsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag {
    
}

- (void)onSocket:(AsyncSocket *)sock didSecure:(BOOL)flag
{
    NSLog(@"onSocket:%p didSecure:YES", sock);
}
- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"onSocket:%p willDisconnectWithError:%@", sock, err);
}
- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    //断开连接了
    NSLog(@"onSocketDidDisconnect:%p", sock);
}

- (void)hidenKeyBoard {
    UITextField *name = (UITextField *)[self.view viewWithTag:USER_NAME_TEXTVIEW];
    UITextField *password = (UITextField *)[self.view viewWithTag:USER_PASSWORD_TEXTVIEW];
    
    [name resignFirstResponder];
    [password resignFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self handleTapRecoginizer:nil];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    textField.secureTextEntry = YES;
    
    return YES;
}

- (void)dealloc {
    self.userName = nil;
    self.userPassword = nil;
    
    [super dealloc];
}

@end
