//
//  DriverInfo.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "DriverInfo.h"

@implementation DriverInfo
@synthesize name = _name;
@synthesize driverID = _driverID;

- (id)initWithName:(NSString *)name driverID:(NSString *)driverId sex:(GENDER_TYPE)sex {
    if (self = [super init]) {
        self.name = name;
        self.driverID = driverId;
        _gender = sex;
    }
    
    return self;
}


@end
