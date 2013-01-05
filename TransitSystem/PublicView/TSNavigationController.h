//
//  TSNavigationController.h
//  TransitSystem
//
//  Created by li haijin on 13-1-5.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSNavigationController : UINavigationController {
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController;

+ (void)setNavigationBarTitle:(UIViewController *)viewControlle withTitle:(NSString *)title;

+ (void)setNavigationBarRightButton:(UIViewController *)viewController withImage:(UIImage *)image action:(SEL)action;

+(void)setNavigationBar:(UIViewController *) viewController title:(NSString*)title leftBtnTitle:(NSString*)title rightBtnTitle:(NSString*)title leftBtnAction:(SEL)actionLeftBtn rightBtnAction:(SEL)actionRightBtn;



@end
