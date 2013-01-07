//
//  TSCommonAnimations.m
//  TransitSystem
//
//  Created by li haijin on 13-1-7.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSCommonAnimations.h"

@implementation TSCommonAnimations

+ (void)animationWithShake:(UIView *)view frame:(CGRect)frame {
    
    CGRect currentViewFrame = view.frame;
    
    [UIView animateWithDuration:0.15f animations:^{
        [view setFrame:frame];
        
    }
                     completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:0.25f animations:^{
                                 [view setFrame:[self animationDeriction:currentViewFrame newFrame:frame]];
                                 
                             }
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [UIView animateWithDuration:0.15f animations:^{
                                                          [view setFrame:frame];
                                                          
                                                      }
                                                                       completion:^(BOOL finished){
                                                                           if (finished) {
                                                                               
                                                                           }
                                                                       }];
                                                  }
                                              }];
                         }
                     }];
}

+ (CGRect)animationDeriction:(CGRect)currentFrame newFrame:(CGRect)newFrame {
    if (currentFrame.origin.x < newFrame.origin.x) {
        return CGRectMake(newFrame.origin.x - newFrame.size.width / 3.0f, newFrame.origin.y, newFrame.size.width, newFrame.size.height);
    }else if (currentFrame.origin.x > newFrame.origin.x) {
        return CGRectMake(currentFrame.origin.x - (currentFrame.size.width - currentFrame.size.width / 3.0f), newFrame.origin.y, newFrame.size.width, newFrame.size.height);
    }
    
    if (currentFrame.origin.y < newFrame.origin.y) {
        return CGRectMake(newFrame.origin.x, newFrame.origin.y - newFrame.size.height / 3.0f, newFrame.size.width, newFrame.size.height);
    }else if (currentFrame.origin.y > newFrame.origin.y) {
        return CGRectMake(newFrame.origin.x, currentFrame.origin.y - (currentFrame.size.height - currentFrame.size.height / 3.0f), newFrame.size.width, newFrame.size.height);
    }
    
    return currentFrame;
}

+ (void)animationRetractableWithView:(UIView *)view frame:(CGRect)frame {
    CGRect currentViewFrame = view.frame;
    
    [UIView animateWithDuration:0.15f animations:^{
        [view setFrame:frame];
        
    }
                     completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:0.05f animations:^{
                                 [view setFrame:[self animationRetractableDeriction:currentViewFrame newFrame:frame]];
                             }
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [UIView animateWithDuration:0.15f animations:^{
                                                          [view setFrame:frame];
                                                          
                                                      }
                                                                       completion:^(BOOL finished){
                                                                           if (finished) {
                                                                               
                                                                           }
                                                                       }];
                                                  }
                                              }];
                         }
                     }];
}

+ (CGRect)animationRetractableDeriction:(CGRect)currentFrame newFrame:(CGRect)newFrame {
    if (currentFrame.size.width < newFrame.size.width) {
        return CGRectMake(currentFrame.origin.x, newFrame.origin.y, newFrame.size.width - newFrame.size.width / 3, newFrame.size.height);
    }else if (currentFrame.size.width > newFrame.size.width) {
        return CGRectMake(currentFrame.origin.x, newFrame.origin.y, newFrame.size.width - newFrame.size.width / 3, newFrame.size.height);
    }
    
    if (currentFrame.size.height < newFrame.size.height) {
        return CGRectMake(newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height - newFrame.size.height / 3.0f);
    }else if (currentFrame.size.height > newFrame.size.height) {
        return newFrame;
    }
    
    return currentFrame;
}


@end
