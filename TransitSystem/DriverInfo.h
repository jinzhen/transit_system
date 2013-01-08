//
//  DriverInfo.h
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MAN = 0,
    WOMAN,
    OTHER     //MGD
    
}GENDER_TYPE;

//驾驶员服务诚信度
typedef enum {
    INTEGRITY_QUALITY_POOR = 0,
    INTEGRITY_QUALITY_GENERAL,
    INTEGRITY_QUALITY_GOOD,
    INTEGRITY_QUALITY_EXCELLENT
}INTEGRITY_QUALITY_TYPE;

@interface DriverInfo : NSObject {
    NSString *_driverID; //身份证
    NSString *_name;
    int _age;
    UIImage *_headImage;
    GENDER_TYPE _gender;
    int _driverYears;
    BOOL _isHaveInfractionsHistory; //违规历史记录
    INTEGRITY_QUALITY_TYPE *_driverIntegrity;  //驾驶员诚信度
}

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *driverID;
@property(nonatomic, retain)UIImage *headImage;
@property(nonatomic, assign)GENDER_TYPE gender;
@property(nonatomic, assign)int age;
@property(nonatomic, assign)int driverYears;

- (id)initWithName:(NSString *)name driverID:(NSString *)driverId headImage:(UIImage *)image sex:(GENDER_TYPE)sex;

@end
