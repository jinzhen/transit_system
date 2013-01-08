//
//  TS.h
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transportation.h"

@interface TSTransportationView : UIView <UITableViewDataSource, UITableViewDelegate>{
    Transportation *_trans;
    UIImageView *_headImage;
    UIImageView *_carImage;
    UITableView *_infoTableVIew;
}

@property(nonatomic, retain)Transportation *trans;
@property(nonatomic, retain)UIImageView *headImage;
@property(nonatomic, retain)UIImageView *carImage;
@property(nonatomic, retain)UITableView *infoTableView;

- (id)initWithFrame:(CGRect)frame;
- (id)initWithTransportation:(Transportation *)trans;


@end
