//
//  ViewController.m
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import "ViewController.h"
#import "LocationService.h"
#import "Weather.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    _locationService = [LocationService alloc];
    [super viewDidLoad];
    [_locationService getCurrentLocation];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressed:(id)sender {
    
    
    
    
    CLLocationCoordinate2D location = [_locationService deviceLocation];
    Weather *weather = [[Weather alloc]init];
    [weather getWeatherWithCoordinate:location withCallBack:^(NSError *error, NSNumber *result)
     {
    NSNumber *temp = result;
    
    _labelWeather.text = [NSString stringWithFormat:@"%@", temp];
     }];
}
@end
