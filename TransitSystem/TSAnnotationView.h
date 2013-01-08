//
//  TSAnnotationView.h
//  TransitSystem
//
//  Created by li haijin on 13-1-8.
//  Copyright (c) 2013年 li haijin. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TSAnnotationView : MKPinAnnotationView {
    
}

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
;
@end
