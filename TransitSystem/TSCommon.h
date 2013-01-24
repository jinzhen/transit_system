//
//  TSCommon.h
//  TransitSystem
//
//  Created by li haijin on 13-1-23.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "TSSocketPacket.h"

@interface TSCommon : NSObject {
    
}

+ (TSSocketPacket *)splitSocketPacket:(NSData *)data;
+ (NSString *)getIPAddress;
+ (BOOL)isHeartBeatPacket:(NSData *)data;
+ (BOOL)isUserInformation:(NSData *)data;
+ (void)sendDataToServerWith:(AsyncSocket *)socket type:(uint8_t)type data:(NSData *)data;
+ (void)recvDataFromServerWith:(AsyncSocket *)socket;

@end
