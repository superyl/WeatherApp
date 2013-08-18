//
//  LocationService.m
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import "LocationService.h"



@implementation LocationService
- (CLLocationCoordinate2D)deviceLocation {
    CLLocationCoordinate2D theLocation;
    theLocation.longitude = _locationManager.location.coordinate.longitude;
    theLocation.latitude = _locationManager.location.coordinate.latitude;
 
    return theLocation;
}

-(void)getCurrentLocation
{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    
    
    [_locationManager startUpdatingLocation];
}
@end

