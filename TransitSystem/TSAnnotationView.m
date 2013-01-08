//
//  TSAnnotationView.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSAnnotationView.h"

@implementation TSAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect frame = self.frame;
        frame.size = CGSizeMake(60.0, 85.0);
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        self.centerOffset = CGPointMake(-5, -5);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"taxi.png"] drawInRect:CGRectMake(30, 30.0, 30.0, 30.0)];
}


@end
