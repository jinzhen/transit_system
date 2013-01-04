//
//  CityInfo.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject {
    float longitude;  //经度
    float latitude;   //纬度
}

@end

@interface CityInfo : NSObject {
    NSString *cityName;
    Place *place;
}

@end
