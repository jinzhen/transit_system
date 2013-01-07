//
//  TSMapViewMenu.h
//  TransitSystem
//
//  Created by li haijin on 13-1-7.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMenuItem : UIView {
    UIImageView *_imageView;
    UIImage *normalImage;
    UIImage *clickImage;
}

@property(retain)UIImageView *imageView;

- (id)initWithImage:(UIImage *)image;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;
- (void)addTarget:(id)target action:(SEL)action;

@end

typedef enum {
    RANK_H,
    RANK_V
}RANK_TYPE;

@interface TSMapViewMenu : UIView {
    int _itemCount;
    CGRect _menuFrame;
    NSMutableArray *_imageViewItems;
    RANK_TYPE rankType;
}

@property(nonatomic, retain)NSMutableArray *imageViewItems;
@property(nonatomic, assign)CGRect menuFrame;

- (id)initWithFrame:(CGRect)frame rankType:(RANK_TYPE)rank;

- (void)addItemToMenu:(TSMenuItem *)item;


@end
