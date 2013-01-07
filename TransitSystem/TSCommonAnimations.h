//
//  TSCommonAnimations.h
//  TransitSystem
//
//  Created by li haijin on 13-1-7.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ANIMATION_DERICTION_NONE,
    
    ANIMATION_DERICTION_UP,
    ANIMATION_DERICTION_DOWN,
    ANIMATION_DERICTION_RIGHT,
    ANIMATION_DERICTION_LEFT,
    
    ANIMATION_DERICTION_UP_RIGHT,
    ANIMATION_DERICTION_UP_LEFT,
    ANIMATION_DERICTION_DOWN_RIGHT,
    ANIMATION_DERICTION_DOWN_LEFT
}ANIMATION_DERICTION_TYPE;

@interface TSCommonAnimations : NSObject

+ (void)animationWithShake:(UIView *)view frame:(CGRect)frame;

@end
