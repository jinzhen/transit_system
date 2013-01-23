//
//  TSCommon.m
//  TransitSystem
//
//  Created by li haijin on 13-1-23.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "TSCommon.h"
#import "TSSocketPacket.h"

@implementation TSCommon

+ (TSSocketPacket *)splitSocketPacket:(NSData *)data {
    if (!data) {
        return nil;
    }
    
    uint8_t type;
    int lenth = [data length];
    char *buf[lenth - 1];

    [data getBytes:&type range:NSMakeRange(0, 1)];
    [data getBytes:buf range:NSMakeRange(1, lenth - 1)];
    NSData *packetContent = [NSData dataWithBytes:buf length:lenth - 1];
    TSSocketPacket *packet = [[[TSSocketPacket alloc] initWithSocketPacketType:type socketData:packetContent] autorelease];
    
    return packet;
    
}


+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}

+ (BOOL)isHeartBeatPacket:(NSData *)data {
    TSSocketPacket *packet = [[TSSocketPacket alloc] initWithSocketPacketType:0 socketData: [[TSCommon getIPAddress] dataUsingEncoding:NSUTF8StringEncoding]];
    if ([[packet getFormatSocktPacketData] isEqualToData:data]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isUserInformation:(NSData *)data {
    TSSocketPacket *packet = [self splitSocketPacket:data];
    if (1 == packet.socketPacketType) {
        return YES;
    }
    return NO;
}


+ (void)sendDataToServerWith:(AsyncSocket *)socket type:(uint8_t)type data:(NSData *)data {
    TSSocketPacket *packet = [[TSSocketPacket alloc] initWithSocketPacketType:type socketData: [[TSCommon getIPAddress] dataUsingEncoding:NSUTF8StringEncoding] ];
    
    [socket writeData:[packet getFormatSocktPacketData] withTimeout:3 tag:100];
    [packet release];
}


@end
