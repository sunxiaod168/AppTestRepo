//
//  ViewController.m
//  ColorTilt
//
//  Created by 孙晓冬 on 14-3-8.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .01;
    self.motionManager.gyroUpdateInterval = .01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controlHardware:(id)sender {
    if ([self.toggleAccelerometer isOn]) {
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            [self doAcceleration:accelerometerData.acceleration];
        }];
    } else {
        [self.motionManager stopAccelerometerUpdates];
    }
    
    if ([self.toggleGyroscope isOn] && self.motionManager.gyroAvailable) {
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            [self doRotation:gyroData.rotationRate];
        }];
    } else {
        [self.toggleGyroscope setOn:NO animated:YES];
        [self.motionManager stopGyroUpdates];
    }
}
- (void)doAcceleration:(CMAcceleration)acceleration{
    if (acceleration.x > 1.3) {
        self.colorView.backgroundColor = [UIColor greenColor];
    }else if (acceleration.x < -1.3){
        self.colorView.backgroundColor = [UIColor orangeColor];
    }else if (acceleration.y > 1.3){
        self.colorView.backgroundColor = [UIColor redColor];
    }else if (acceleration.y < -1.3){
        self.colorView.backgroundColor = [UIColor blueColor];
    }else if (acceleration.z > 1.3){
        self.colorView.backgroundColor = [UIColor yellowColor];
    }else if (acceleration.z < -1.3){
        self.colorView.backgroundColor = [UIColor purpleColor];
    }
    double value = fabs(acceleration.x);
    if (value > 1.0) {
        value = 1.0;
    }
    self.colorView.alpha = value;
    
}

- (void)doRotation:(CMRotationRate)rotation{
    double value = (fabs(rotation.x) + fabs(rotation.y) + fabs(rotation.z)) / 8.0;
    if (value > 1.0) {
        value = 1.0;
    }
    self.colorView.alpha = value;
    
}

- (BOOL)shouldAutorotate{
    return NO;
}
@end
















