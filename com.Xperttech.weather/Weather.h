//
//  Weather.h
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationService.h"
#import "AFJSONRequestOperation.h"
@interface Weather : NSObject

@property (strong, nonatomic)NSString *baseURL;
@property (strong, nonatomic)NSNumber *apiVersion;
@property (strong, nonatomic)NSString *apiKey;
@property (strong, nonatomic)NSString *lang;
@property (strong, nonatomic)NSNumber *returnTemp;
@property (strong,nonatomic) NSOperationQueue *weatherQueue;

-(void)getWeatherWithCoordinate:(CLLocationCoordinate2D)location withCallBack:( void (^)( NSError  *error, NSNumber *result ) )callback;
@end


