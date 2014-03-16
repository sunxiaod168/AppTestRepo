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
#define kDeg2Rad 0.0174532529
#define kRad2Deg 57.2957795

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
    
    if ([CLLocationManager headingAvailable]) {
        self.locMan.headingFilter = 10; // 10 degrees
        [self.locMan startUpdatingHeading];
    }
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
        self.recentLocation = newLocation;
        
        CLLocation *Cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        CLLocationDistance delta = [Cupertino distanceFromLocation:newLocation];
        long miles = (delta * 0.000621371) + 0.5; // meters to rounded miles
        if (miles < 3) {
            [self.locMan stopUpdatingLocation];
            [self.locMan stopUpdatingHeading];
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

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    if (self.recentLocation != nil && newHeading.headingAccuracy >= 0) {
        CLLocation *cupertino = [[CLLocation alloc] initWithLatitude:kCupertinoLatitude longitude:kCupertinoLongitude];
        double course = [self headingToLocation:cupertino.coordinate current:self.recentLocation.coordinate];
        double delta = newHeading.trueHeading - course;
        if (abs(delta) <= 10) {
            self.directionArrow.image = [UIImage imageNamed:@"up_arrow.png"];
        }else{
            if (abs(delta) > 180) {
                self.directionArrow.image = [UIImage imageNamed:@"right_arrow.png"];
            }else if(delta > 0){
                self.directionArrow.image = [UIImage imageNamed:@"left_arrow.png"];
            }else if(delta > -180){
                self.directionArrow.image = [UIImage imageNamed:@"right_arrow.png"];
            }else{
                self.directionArrow.image = [UIImage imageNamed:@"left_arrow.png"];
            }
        }
        self.directionArrow.hidden = NO;
    }else{
        self.directionArrow.hidden = YES;
    }
}

- (double)headingToLocation:(CLLocationCoordinate2D)desired current:(CLLocationCoordinate2D)current{
    double lat1 = current.latitude * kDeg2Rad;
    double lat2 = desired.latitude * kDeg2Rad;
    double lon1 = current.longitude;
    double lon2 = desired.longitude;
    double dlon = (lon2 - lon1) * kDeg2Rad;
    
    double y = sin(dlon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dlon);
    double heading = atan2(y, x);
    heading = heading * kRad2Deg;
    heading = heading + 360.0;
    heading = fmod(heading, 360.0);
    return heading;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end















