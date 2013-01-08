//
//  DataTransmission.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "DataTransmission.h"

@implementation DataTransmission
@synthesize socket = _socket;


- (id)init {
    if (self = [super init]) {
        self.socket = [[AsyncSocket alloc] init];
    }
    
    return self;
}
- (id)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        self.socket = [[AsyncSocket alloc] initWithDelegate:delegate];
    }
    
    return self;
}
- (id)initWithDelegate:(id)delegate userData:(long)userData {
    if (self = [super init]) {
        self.socket = [[AsyncSocket alloc] initWithDelegate:delegate userData:userData];
    }
    
    return self;
}

- (BOOL)connectToHost:(NSString *)hostname
               onPort:(UInt16)port
          withTimeout:(NSTimeInterval)timeout
                error:(NSError **)errPtr {
    
    return [self.socket connectToHost:hostname onPort:port withTimeout:timeout error:errPtr];
}

- (void)readDataWithTimeout:(NSTimeInterval)timeout tag:(long)tag {
    
    [self.socket readDataWithTimeout:timeout tag:tag];
}

- (void)writeData:(NSData *)data withTimeout:(NSTimeInterval)timeout tag:(long)tag {
    
    [self.socket writeData:data withTimeout:timeout tag:tag];
}


@end
