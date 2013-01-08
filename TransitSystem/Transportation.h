//
//  Transportation.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DriverInfo.h"
//交通工具类型
typedef enum {
    TRANSPORTATION_BUS = 0,
    TRANSPORTATION_TAXI
}TRANSPORTATION_TYPE;



@interface Transportation : NSObject {
    NSString *_transportationID;   //车牌号
    TRANSPORTATION_TYPE *_transportationType;
    float _averageSpeed;
    
    DriverInfo *_driver;
}
@property(nonatomic, retain)DriverInfo *driver;
@property(nonatomic, retain)NSString *transportationID;

- (id)initWithTransportationID:(NSString *)transID driverInfo:(DriverInfo *)driver;

@end
