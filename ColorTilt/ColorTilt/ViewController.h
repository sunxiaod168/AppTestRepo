//
//  ViewController.h
//  ColorTilt
//
//  Created by 孙晓冬 on 14-3-8.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) IBOutlet UISwitch *toggleAccelerometer;
@property (strong, nonatomic) IBOutlet UISwitch *toggleGyroscope;
@property (strong, nonatomic) CMMotionManager *motionManager;

- (IBAction)controlHardware:(id)sender;
- (void)doAcceleration:(CMAcceleration)acceleration;
- (void)doRotation:(CMRotationRate)rotation;


@end
