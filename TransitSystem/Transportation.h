//
//  Transportation.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
//交通工具类型
typedef enum {
    TRANSPORTATION_BUS = 0,
    TRANSPORTATION_TAXI
}TRANSPORTATION_TYPE;

//驾驶员服务诚信度
typedef enum {
    INTEGRITY_QUALITY_POOR = 0,
    INTEGRITY_QUALITY_GENERAL,
    INTEGRITY_QUALITY_GOOD,
    INTEGRITY_QUALITY_EXCELLENT
}INTEGRITY_QUALITY_TYPE;

@interface Transportation : NSObject {
    TRANSPORTATION_TYPE transportationType; 
    float speed;
    NSString *driverName;
    INTEGRITY_QUALITY_TYPE driverIntegrity;  //驾驶员诚信度
    
}

@end
