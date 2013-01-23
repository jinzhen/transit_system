//
//  Login.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

@interface Login : UIViewController<UITextFieldDelegate, UIScrollViewDelegate, AsyncSocketDelegate> {
    NSString *_userName;
    NSString *_userPassword;
    int32_t userID;
    
    NSTimer *_time;
    AsyncSocket *_socket;
    
    BOOL isBeatting;
    int overRepeatTime;
}

@property (nonatomic, retain)NSString *userName;
@property (nonatomic, retain)NSString *userPassword;

- (id)init;

@end
