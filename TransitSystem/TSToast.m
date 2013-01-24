//
//  TSToast.m
//  TransitSystem
//
//  Created by li haijin on 13-1-24.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSToast.h"
#import <QuartzCore/QuartzCore.h> 

#define DEFAULT_DISPLAY_DURATION 2.0f


@interface TSToast (private)

- (id)initWithText:(NSString *)text_;
- (void)setDuration:(CGFloat) duration_;

- (void)dismisToast;
- (void)toastTaped:(UIButton *)sender_;

- (void)showAnimation;
- (void)hideAnimation;

- (void)show;
- (void)showFromTopOffset:(CGFloat) topOffset_;
- (void)showFromBottomOffset:(CGFloat) bottomOffset_;

@end



@implementation TSToast


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:[UIDevice currentDevice]];
    [contentView release],contentView = nil;
    [text release],text = nil;
    [super dealloc];
}


- (id)initWithText:(NSString *)tstext{
    if (self = [super init]) {
        
        text = [tstext copy];
        
        UIFont *font = [UIFont boldSystemFontOfSize:14];
        CGSize textSize = [text sizeWithFont:font
                           constrainedToSize:CGSizeMake(280, MAXFLOAT)
                               lineBreakMode:UILineBreakModeWordWrap];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 12, textSize.height + 12)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = font;
        textLabel.text = text;
        textLabel.numberOfLines = 0;
        
        contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
        contentView.layer.cornerRadius = 5.0f;
        contentView.layer.borderWidth = 1.0f;
        contentView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        contentView.backgroundColor = [UIColor colorWithRed:0.2f
                                                      green:0.2f
                                                       blue:0.2f
                                                      alpha:0.75f];
        [contentView addSubview:textLabel];
        contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [contentView addTarget:self
                        action:@selector(toastTaped:)
              forControlEvents:UIControlEventTouchDown];
        contentView.alpha = 0.0f;
        [textLabel release];
        
        duration = DEFAULT_DISPLAY_DURATION;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(deviceOrientationDidChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:[UIDevice currentDevice]];
    }
    return self;
}

- (void)deviceOrientationDidChanged:(NSNotification *)notify{
    [self hideAnimation];
}

-(void)dismissToast{
    [contentView removeFromSuperview];
}

-(void)toastTaped:(UIButton *)sender{
    [self hideAnimation];
}

- (void)setDuration:(CGFloat) tsDuration{
    duration = tsDuration;
}

-(void)showAnimation{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

-(void)hideAnimation{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 0.0f;
    [UIView commitAnimations];
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = window.center;
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromTopOffset:(CGFloat) top{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, top + contentView.frame.size.height/2);
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromBottomOffset:(CGFloat) bottom{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, window.frame.size.height-(bottom + contentView.frame.size.height/2));
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}


+ (void)showWithText:(NSString *)text{
    [TSToast showWithText:text duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
            duration:(CGFloat)duration{
    TSToast *toast = [[[TSToast alloc] initWithText:text] autorelease];
    [toast setDuration:duration];
    [toast show];
}

+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset{
    [TSToast showWithText:text  topOffset:topOffset duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
           topOffset:(CGFloat)topOffset
            duration:(CGFloat)duration{
    TSToast *toast = [[[TSToast alloc] initWithText:text] autorelease];
    [toast setDuration:duration];
    [toast showFromTopOffset:topOffset];
}

+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat)bottomOffset{
    [TSToast showWithText:text  bottomOffset:bottomOffset duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text
        bottomOffset:(CGFloat)bottomOffset
            duration:(CGFloat)duration{
    TSToast *toast = [[[TSToast alloc] initWithText:text] autorelease];
    [toast setDuration:duration];
    [toast showFromBottomOffset:bottomOffset];
}




@end
