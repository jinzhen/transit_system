//
//  MapViewController.h
//  TransitSystem
//
//  Created by li haijin on 13-1-4.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h> 
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController {
    MKMapView *_map;
    CLLocationManager *_locationManager;
}

@property(nonatomic, retain)MKMapView *map;
@property(nonatomic, retain)CLLocationManager *locationManager;


- (id)init;


@end
