//
//  Transportation.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "Transportation.h"

@implementation Transportation
@synthesize transportationID = _transportationID;
@synthesize driver = _driver;

- (id)initWithTransportationID:(NSString *)transID driverInfo:(DriverInfo *)driver {
    if (self = [super init]) {
        self.driver = driver;
        self.transportationID = transID;
    }
    
    return self;
}

@end
