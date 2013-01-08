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
@synthesize carTypeInfo = _carTypeInfo;

- (id)initWithTransportationID:(NSString *)transID driverInfo:(DriverInfo *)driver carImage:(UIImage *)carImg carInfo:(NSString *)carInfo {
    if (self = [super init]) {
        self.driver = driver;
        self.transportationID = transID;
        self.carImage = carImg;
        self.carTypeInfo = carInfo;
    }
    
    return self;
}

@end
