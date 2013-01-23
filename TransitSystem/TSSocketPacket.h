//
//  TSSocketPacket.h
//  TransitSystem
//
//  Created by li haijin on 13-1-23.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface TSSocketPacket : NSObject {
    uint8_t _socketPacketType;
    NSString *_data;
    int _length;
    
    NSString *_socketPacket;
}

@property(nonatomic, assign)uint8_t socketPacketType;
@property(nonatomic, retain)NSString *data;
@property(nonatomic, retain)NSString *socketPacket;

- (id)initWithSocketPacketType:(uint8_t)type socketData:(NSData *)data;
- (NSData *)getFormatSocktPacketData;

@end
