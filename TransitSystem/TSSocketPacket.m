//
//  TSSocketPacket.m
//  TransitSystem
//
//  Created by li haijin on 13-1-23.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSSocketPacket.h"

@implementation TSSocketPacket
@synthesize socketPacketType = _socketPacketType;
@synthesize data = _data;
@synthesize socketPacket = _socketPacket;

- (id)initWithSocketPacketType:(uint8_t)type socketData:(NSData *)data {
    if (self = [super init]) {
        self.socketPacketType = type;
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.data = dataStr;
        [dataStr release];
        
        _length = self.data.length + 1;
        
        self.socketPacket = [[NSString alloc] initWithFormat:@"%d%d%@", self.socketPacketType, _length, self.data];
    }
    
    return self;
}

- (NSData *)getFormatSocktPacketData {
    return [[[NSData alloc] initWithData:[self.socketPacket dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
}

- (void)dealloc {
    self.data = nil;
    self.socketPacket = nil;
    
    [super dealloc];
}

@end
