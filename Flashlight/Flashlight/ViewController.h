//
//  ViewController.h
//  Flashlight
//
//  Created by 孙晓冬 on 14-3-2.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (strong, nonatomic) IBOutlet UIView *lightSource;

- (IBAction)setLightSourceAlphaValue:(id)sender;

@end
