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
    
    [TSNavigationController setNavigationBarRightButton:self withImage:[UIImage imageNamed:@"menu.png" ] action:@selector(handleMenu)];
    
    self.map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
    self.map.showsUserLocation = YES;
    self.map.mapType =MKMapTypeStandard;
    [self.view addSubview:self.map];
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(39.915352,116.397105);
    
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
    [self createMenuView];
}

- (void)createMenuView {
    self.menu = [[TSMapViewMenu alloc] initWithFrame:CGRectMake(270, -150, 50, 150) rankType:RANK_V];
    self.menu.backgroundColor = [UIColor redColor];
    
    
    TSMenuItem *settingItem = [[TSMenuItem alloc] initWithImage:[UIImage imageNamed:@"setting.png"]];
    [settingItem addTarget:self action:@selector(handleClickItem)];
    [self.menu addItemToMenu:settingItem];
    [self.view addSubview:self.menu];
}

- (void)handleMenu {
    
    if (self.menu.frame.origin.y < 0) {
        [TSCommonAnimations animationWithShake:self.menu frame:CGRectMake(270, 40, 50, 150)];
    } else {
        [TSCommonAnimations animationWithShake:self.menu frame:CGRectMake(270, -150, 50, 150)];
    }
}

- (void)handleClickItem {
    
}


- (void)dealloc {
    self.map = nil;
    self.menu = nil;
}

@end
