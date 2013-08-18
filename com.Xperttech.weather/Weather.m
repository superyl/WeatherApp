//
//  Weather.m
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import "Weather.h"
#import "LocationService.h"
#import "AFJSONRequestOperation.h"

@implementation Weather



-(void)getWeatherWithCoordinate:(CLLocationCoordinate2D)location withCallBack:( void (^)( NSError *error, NSNumber *result ) )callback

{
    

    NSOperationQueue *callerQueue = [NSOperationQueue currentQueue];
    
    _baseURL = @"http://api.openweathermap.org/data/";
    _apiVersion =[NSNumber numberWithDouble:2.5];
    NSNumber *temp=[[NSNumber alloc]init];
    _apiKey = @"2f519ada727faef6634a6ae75dd6cbca";
    NSString *langString;
    if (_lang && _lang.length > 0) {
        langString = [NSString stringWithFormat:@"&lang=%@", _lang];
    } else {
        langString = @"";
    }
    NSString *method = [NSString stringWithFormat:@"/forecast?lat=%f&lon=%f",
                        location.latitude, location.longitude ];

    NSString *urlString = [NSString stringWithFormat:@"%@%@%@&APPID=%@%@", _baseURL, _apiVersion, method, _apiKey, langString];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSNumber *returnTemp= [self convertJSONtoArrayOfDictionaries:JSON];
        [callerQueue addOperationWithBlock:^{
            callback(nil, returnTemp);}];
        //operation;
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [callerQueue addOperationWithBlock:^{
            callback(error,nil);
        
    }];
    }];
    //return _returnTemp;

     [_weatherQueue addOperation:operation];
    
}

-(NSNumber *) convertJSONtoArrayOfDictionaries: (NSDictionary *)data
{
    
    
    
    NSArray *listDic = [data objectForKey:@"list"];
    NSDictionary *nowDic= listDic[0];
    NSDictionary *mainDic = nowDic[@"main"];
    NSNumber *temp = mainDic[@"temp"];
    temp = @(temp.floatValue - 273);
    return temp;
    
}



@end;
