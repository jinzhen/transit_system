//
//  IntegrityView.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "IntegrityView.h"

@implementation IntegrityView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initIntegrity];
    }
    return self;
}

- (void)initIntegrity {
    
    for (int i = 0; i < TS_IntegrityRange; i++) {
        
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
