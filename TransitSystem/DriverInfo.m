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
@synthesize headImage = _headImage;
@synthesize gender = _gender;
@synthesize age = _age;
@synthesize driverYears = _driverYears;

- (id)initWithName:(NSString *)name driverID:(NSString *)driverId headImage:(UIImage *)image sex:(GENDER_TYPE)sex {
    if (self = [super init]) {
        self.name = name;
        self.driverID = driverId;
        _gender = sex;
    }
    
    return self;
}


@end
