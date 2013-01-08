//
//  TS.m
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "TSTransportationView.h"

#define TS_DriverName 0
#define TS_DriverID 1
#define TS_DriverGender 2
#define TS_DriverAge 3
#define TS_DriverYears 4

#define TS_CarID 5
#define TS_CarInfo 6


@implementation TSTransportationView
@synthesize trans = _trans;
@synthesize headImage =_headImage;
@synthesize carImage = _carImage;
@synthesize infoTableView = _infoTableVIew;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTransportation:(Transportation *)trans {
    if (self = [super init]) {
        self.trans = trans;
        [self initTransportationView];
    }
    
    return self;
}

- (void)initTransportationView {
    
}

- (void)initBaseView {
    [self setFrame:CGRectMake(40.0f, 60.0f, 240.0f, 300.0f)];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"back_image.png"]];
    [self setBackgroundColor:background];
}

- (void)initHeadView {
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 105.0f, 105.0f)];
    [self.headImage setImage:self.trans.driver.headImage];
    [self addSubview:self.headImage];
    
    self.carImage = [[UIImageView alloc] initWithFrame:CGRectMake(125.0f, 10.0f, 105.0f, 105.0f)];
    [self.carImage setImage:self.trans.carImage];
    [self addSubview:self.carImage];
    
    self.infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(10.0f, 115.0f, 220.0f, 180.0f)];
    self.infoTableView.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.infoTableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell=nil;
    if (cell == nil)
	{
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
    cell.textLabel.textColor = [UIColor colorWithRed:0x24/255.0 green:0x24/255.0 blue:0x24/255.0 alpha:1];
    switch (indexPath.section) {
        case TS_DriverName:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"name:";
            cell.detailTextLabel.text = self.trans.driver.name;
        }
            break;
        case TS_DriverID:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Driver ID:";
            cell.detailTextLabel.text = self.trans.driver.driverID;
        }
            break;
        case TS_DriverGender:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Gender:";
            cell.detailTextLabel.text = self.trans.driver.gender == MAN ? @"MAN" : @"WOMAN";
        }
            break;
        case TS_DriverAge:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Age:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.trans.driver.age ];
        }
            break;
        case TS_DriverYears:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Driver Years:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.trans.driver.driverYears];
        }
            break;
        case TS_CarID:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Car ID:";
            cell.detailTextLabel.text = self.trans.transportationID;
        }
            break;
        case TS_CarInfo:
        {
            [cell.imageView setImage:[UIImage imageNamed:@""]];
            cell.textLabel.text = @"Car Info:";
            cell.detailTextLabel.text = self.trans.carTypeInfo;
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Driver infomation:";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    /*
     insert command with star
     */
    
    UIView *view = [[UIView alloc] init];
    
    return view;
}


- (void)dealloc {
    self.trans = nil;
    self.headImage = nil;
    self.carImage = nil;
    self.infoTableView = nil;
}


@end
