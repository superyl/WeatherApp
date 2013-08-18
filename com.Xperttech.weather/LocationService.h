//
//  LocationService.h
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationService : NSObject
    

@property(nonatomic,retain) CLLocationManager *locationManager;
-(void)getCurrentLocation;
- (CLLocationCoordinate2D)deviceLocation;
@end

