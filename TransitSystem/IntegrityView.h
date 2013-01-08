//
//  IntegrityView.h
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TS_IntegrityRange 4

@interface IntegrityView : UIView {
    UIImageView *_imageView;
}
@property(nonatomic, retain)UIImageView *imageView;

- (id)initWithFrame:(CGRect)frame;

@end
