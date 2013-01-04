//
//  CityInfo.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject {
    float _longitude;  //经度
    float _latitude;   //纬度
}

@end

@interface CityInfo : NSObject {
    NSString *_cityName;
    Place *_cityPlace;
}
@property(nonatomic, retain)NSString *cityName;
@property(nonatomic, retain)Place *cityPlace;
@end
