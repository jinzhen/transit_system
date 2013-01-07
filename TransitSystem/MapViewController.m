//
//  MapViewController.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "MapViewController.h"
#import "TSNavigationController.h"
#import "TSCommonAnimations.h"
#import "TSMapViewMenu.h"

#define MENU_TAG 111111

@implementation MapViewController
@synthesize map = _map;
@synthesize locationManager = _locationManager;
@synthesize menu = _menu;

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [TSNavigationController setNavigationBar:self title:@"TRANSIT SYS" leftBtnTitle:nil rightBtnTitle:nil leftBtnAction:nil rightBtnAction:nil];
    
    [TSNavigationController setNavigationBarRightButton:self withImage:[UIImage imageNamed:@"menu_up.png" ] action:@selector(handleMenu)];
    
    self.map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
//    self.map.showsUserLocation = YES;
    self.map.mapType =MKMapTypeStandard;
    [self.view addSubview:self.map];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    
    [self createMenuView];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self.locationManager stopUpdatingLocation];
    
    NSString *strLat = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.latitude];
    NSString *strLng = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.longitude];
    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords,MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locError:%@", error);
    
}

- (void)createMenuView {
    self.menu = [[TSMapViewMenu alloc] initWithFrame:CGRectMake(270, -150, 50, 150) rankType:RANK_V];
    self.menu.backgroundColor = [UIColor clearColor];
    
    
    TSMenuItem *settingItem = [[TSMenuItem alloc] initWithImage:[UIImage imageNamed:@"setting.png"]];
    [settingItem addTarget:self action:@selector(handleClickSettingItem)];
    [self.menu addItemToMenu:settingItem];
    
    
    TSMenuItem *searchItem = [[TSMenuItem alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    [searchItem addTarget:self action:@selector(handleClickSearchItem)];
    [self.menu addItemToMenu:searchItem];

    
    
    [self.view addSubview:self.menu];
}

- (void)handleMenu {
    
    if (self.menu.frame.origin.y < 0) {
        [TSCommonAnimations animationWithShake:self.menu frame:CGRectMake(270, 42, 50, 150)];
        [TSNavigationController setNavigationBarRightButton:self withImage:[UIImage imageNamed:@"menu_down.png" ] action:@selector(handleMenu)];
    } else {
        [TSCommonAnimations animationWithShake:self.menu frame:CGRectMake(270, -150, 50, 150)];
        [TSNavigationController setNavigationBarRightButton:self withImage:[UIImage imageNamed:@"menu_up.png" ] action:@selector(handleMenu)];
    }
}

- (void)handleClickSettingItem {
    
}

- (void)handleClickSearchItem {
    
}


- (void)dealloc {
    self.map = nil;
    self.menu = nil;
}

@end
