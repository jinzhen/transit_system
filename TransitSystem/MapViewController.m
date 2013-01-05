//
//  MapViewController.m
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import "MapViewController.h"
#import "TSNavigationController.h"

#define MENU_TAG 111111

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
    
    [self createMenuView];
    
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

- (void)createMenuView {
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(280, 0, 40, 150)];
    menuView.tag = MENU_TAG;
    UIImageView *settingItem = [self createMenuItemWithImageName:@"" action:@selector(handleSetting)];
    [menuView addSubview:settingItem];
    [settingItem setFrame:CGRectMake(0, 50, 40, 40)];
    
    [self.view addSubview:menuView];
    [menuView setHidden:YES];
}

- (UIImageView *)createMenuItemWithImageName:(NSString *)imageName action:(SEL)action {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName ]];
    [imageView setFrame:CGRectMake(0, 0, 40, 40)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [imageView addGestureRecognizer:tap];
    return imageView;
}

- (void)handleMenu {
    UIView *menuView = [self.view viewWithTag:MENU_TAG];
    
    if (menuView) {
        [menuView setHidden:NO];
    }
}


- (void)dealloc {
    self.map = nil;
}

@end
