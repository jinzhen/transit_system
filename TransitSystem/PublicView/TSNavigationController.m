//
//  TSNavigationController.m
//  TransitSystem
//
//  Created by li haijin on 13-1-5.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSNavigationController.h"

@implementation TSNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.translucent = YES;
        self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    }
    
    return self;
}

+ (void)setNavigationBarTitle:(UIViewController *)viewControlle withTitle:(NSString *)title {
    viewControlle.title = title;
}

+ (void)setNavigationBarRightButton:(UIViewController *)viewController withImage:(UIImage *)image action:(SEL)action{
    
    UIImageView *rightImageView = [[UIImageView alloc] initWithImage:image];
    [rightImageView setFrame:CGRectMake(0, 0, 40, 40)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:viewController action:action];
    [rightImageView addGestureRecognizer:tap];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightImageView];
    viewController.navigationItem.rightBarButtonItem = rightItem;
    
}


+ (void)setNavigationBar:(UIViewController *) viewController title:(NSString*)title leftBtnTitle:(NSString*)lTitle rightBtnTitle:(NSString*)rTitle leftBtnAction:(SEL)actionLeftBtn rightBtnAction:(SEL)actionRightBtn {
    
    viewController.title = title;
    
    UIFont* lFont = [UIFont boldSystemFontOfSize:14];
    CGSize lFontSize = [lTitle sizeWithFont:lFont];
    UIButton* btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame = CGRectMake(0, 0, lFontSize.width+20, 40);
    [btnBack addTarget:viewController action:actionLeftBtn forControlEvents:UIControlEventTouchUpInside];
    [btnBack setTitle:lTitle forState:UIControlStateNormal];
    btnBack.titleLabel.shadowOffset = CGSizeMake(0, -1);
    [btnBack setTitleEdgeInsets:UIEdgeInsetsMake(0,5,0,0)];
    btnBack.titleLabel.font = lFont;
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    viewController.navigationItem.leftBarButtonItem = leftItem;
    
    UIFont* rFont = [UIFont boldSystemFontOfSize:14];
    CGSize rFontSize = [rTitle sizeWithFont:rFont];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, rFontSize.width+20, 40);
    [rightBtn addTarget:viewController action:actionRightBtn forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:rTitle forState:UIControlStateNormal];
    rightBtn.titleLabel.shadowOffset = CGSizeMake(0, -1);
    [rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-2,0,0)];
    rightBtn.titleLabel.font = rFont;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    viewController.navigationItem.rightBarButtonItem = rightItem;
}

@end
