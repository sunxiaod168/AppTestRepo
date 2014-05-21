//
//  ViewController.h
//  Cupertino
//
//  Created by 孙晓冬 on 14-3-16.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    SystemSoundID soundStraight;
    SystemSoundID soundLeft;
    SystemSoundID soundRight;
    int lastSound;
}

@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UIView *distanceView;
@property (strong, nonatomic) IBOutlet UIView *waitView;
@property (strong, nonatomic) CLLocationManager *locMan;
@property (strong, nonatomic) IBOutlet UIImageView *directionArrow;
@property (strong, nonatomic) CLLocation *recentLocation;

- (double)headingToLocation:(CLLocationCoordinate2D)desired current:(CLLocationCoordinate2D)current;

@end
