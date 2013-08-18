//
//  ViewController.h
//  com.Xperttech.weather
//
//  Created by Lei Lei on 8/16/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationService.h"

@interface ViewController : UIViewController
- (IBAction)ButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelWeather;
@property (strong, nonatomic) LocationService *locationService;

@end
