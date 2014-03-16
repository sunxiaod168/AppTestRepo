//
//  ViewController.m
//  Cupertino
//
//  Created by 孙晓冬 on 14-3-16.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "ViewController.h"
#define kCupertinoLatitude 37.3229978
#define kCupertinoLongitude -122.0321823

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.locMan = [[CLLocationManager alloc] init];
    self.locMan.delegate = self;
    self.locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    self.locMan.distanceFilter = 1609; // a mile
    [self.locMan startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if (error.code == kCLErrorDenied) {
        [self.locMan stopUpdatingLocation];
    }
    self.waitView.hidden = YES;
    self.distanceView.hidden = NO;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *newLocation = (CLLocation *)[locations objectAtIndex:locations.count-1];
    if (newLocation.horizontalAccuracy >= 0) {
        CLLocation *Cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        CLLocationDistance delta = [Cupertino distanceFromLocation:newLocation];
        long miles = (delta * 0.000621371) + 0.5; // meters to rounded miles
        if (miles < 3) {
            [self.locMan stopUpdatingLocation];
            self.distanceLabel.text = @"Enjoy the\nMothership!";
        }else{
            NSNumberFormatter *commaDelimited = [[NSNumberFormatter alloc] init];
            [commaDelimited setNumberStyle:NSNumberFormatterDecimalStyle];
            self.distanceLabel.text = [NSString stringWithFormat:@"%@ miles to the\nMothership", [commaDelimited stringFromNumber:[NSNumber numberWithLong:miles]]];
        }
        self.waitView.hidden = YES;
        self.distanceView.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
