//
//  TSToast.h
//  TransitSystem
//
//  Created by li haijin on 13-1-24.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSToast : NSObject {
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}

+ (void)showWithText:(NSString *) text;
+ (void)showWithText:(NSString *) text
            duration:(CGFloat)duration;

+ (void)showWithText:(NSString *) text
           topOffset:(CGFloat) topOffset;
+ (void)showWithText:(NSString *) text
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration;

+ (void)showWithText:(NSString *) text
        bottomOffset:(CGFloat) bottomOffset;
+ (void)showWithText:(NSString *) text
        bottomOffset:(CGFloat) bottomOffset
            duration:(CGFloat) duration;

@end
