//
//  RouteInfo.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityInfo.h"

//路段质量
typedef enum {
    ROUTE_QUALITY_POOR = 0,
    ROUTE_QUALITY_GENERAL,
    ROUTE_QUALITY_GOOD,
    ROUTE_QUALITY_EXCELLENT
}ROUTE_QUALITY_TYPE;

//路段拥挤程度
typedef enum {
    TRAFFIC_STREAM_EXPEDITE = 0,  //畅通
    TRAFFIC_STREAM_AMBLE,         //缓行
    TRAFFIC_STREAM_CROWDED        //拥挤
}TRAFFIC_STREAM_TYPE;


@interface RouteInfo : NSObject {
    ROUTE_QUALITY_TYPE routeType;
    long int pathLenth;
    Place *startPlace;
    Place *endPlace;
}

@end
