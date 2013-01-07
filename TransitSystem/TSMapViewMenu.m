//
//  TSMapViewMenu.m
//  TransitSystem
//
//  Created by li haijin on 13-1-7.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSMapViewMenu.h"

@implementation TSMenuItem
@synthesize imageView = _imageView;

- (id)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        normalImage = image;
        clickImage = image;
        self.imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:self.imageView];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    if (!self.imageView) {
        return;
    }
    
    switch (state) {
        case UIControlStateNormal:
        {
            normalImage = image;
        }
            break;
            
        case UIControlStateHighlighted:
        {
            clickImage = image;
        }
            break;
        default:
            break;
    }
    
    
}

- (void)addTarget:(id)target action:(SEL)action {
    if (!self.imageView) {
        return ;
    }

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [self.imageView addGestureRecognizer:tap];

}

- (void)setFrame:(CGRect)frame {
    [self.imageView setFrame:frame];
}

- (void)dealloc {
    self.imageView = nil;
}

@end
/************************************************************************/



@implementation TSMapViewMenu
@synthesize imageViewItems = _imageViewItems;
@synthesize menuFrame = _menuFrame;

- (id)initWithFrame:(CGRect)frame rankType:(RANK_TYPE)rank{
    if (self = [super init]) {
        _itemCount = 0;
        self.menuFrame = frame;
        self.frame = frame;
        rankType = rank;
        [self initMenuView];
    }
    
    return self;
}

- (void)initMenuView {
    NSMutableArray *itemArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.imageViewItems = itemArray;
}

- (void)addItemToMenu:(TSMenuItem *)item {
    CGRect itemFrame;
    if (rankType == RANK_H) {
        itemFrame = CGRectMake(_itemCount * (self.frame.size.height - 10.0f + 5.0f) + 5.0f, 5.0f, self.frame.size.height - 10.0f, self.frame.size.height - 10.0f);
    }else {
        itemFrame = CGRectMake(5.0f, _itemCount * (self.frame.size.width - 10.0f - 5.0f) + 5.0f, self.frame.size.width - 10.0f, self.frame.size.width - 10.0f);
    }
    
    [item setFrame:itemFrame];
    [self addSubview:item];
    [self.imageViewItems addObject:item];
    _itemCount++;
}

- (void)dealloc {
    self.imageViewItems = nil;
}

@end
