//
//  MapViewController.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "MapViewController.h"
#import "TSNavigationController.h"

@implementation MapViewController
@synthesize map = _map;
@synthesize locationManager = _locationManager;

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [TSNavigationController setNavigationBar:self title:@"TRANSIT SYS" leftBtnTitle:nil rightBtnTitle:nil leftBtnAction:nil rightBtnAction:nil];
    
    [TSNavigationController setNavigationBarRightButton:self withImage:[UIImage imageNamed:@"menu.png" ] action:@selector(handleMenu)];
    
    
    self.map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
    self.map.showsUserLocation = YES;
    self.map.mapType =MKMapTypeStandard;
    [self.view addSubview:self.map];
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(39.915352,116.397105);
    
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
    
    [super viewDidLoad];
}

- (void)handleMenu {
    
}


- (void)dealloc {
    self.map = nil;
}

@end
