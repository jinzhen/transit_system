//
//  MapPoint.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize title = _title;
@synthesize subTitle = _subTitle;
@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subTitle:(NSString *)subtitle {
    if (self = [super init]) {
        _coordinate = coordinate;
        self.title = title;
        self.subTitle = subtitle;
    }
    
    return self;
}

- (void)dealloc {
    self.subTitle = nil;
    self.title = nil;
    
    [super dealloc];
}

@end
