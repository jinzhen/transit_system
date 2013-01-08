//
//  DataTransmission.h
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

@interface DataTransmission : NSObject <AsyncSocketDelegate>{
    AsyncSocket *_socket;
}

@property(nonatomic, retain)AsyncSocket *socket;

- (id)init;
- (id)initWithDelegate:(id)delegate;
- (id)initWithDelegate:(id)delegate userData:(long)userData;

- (BOOL)connectToHost:(NSString *)hostname
               onPort:(UInt16)port
          withTimeout:(NSTimeInterval)timeout
                error:(NSError **)errPtr;

- (void)readDataWithTimeout:(NSTimeInterval)timeout tag:(long)tag;
- (void)writeData:(NSData *)data withTimeout:(NSTimeInterval)timeout tag:(long)tag;
@end
