//
//  PersonInfo.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityInfo.h"
#import "Transportation.h"

@interface PassengerInfo : NSObject {
    NSString *_passengerName;
    Place *_passengerPlace;
    INTEGRITY_QUALITY_TYPE *_passengerIntegrity;
}
@property(nonatomic, retain)NSString *passengerName;
@property(nonatomic, retain)Place *passengerPlace;

@end
