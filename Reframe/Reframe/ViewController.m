//
//  ViewController.m
//  Reframe
//
//  Created by 孙晓冬 on 14-3-6.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.viewLabel.frame = CGRectMake(245, 149, 79, 21);
        self.buttonOne.frame = CGRectMake(20, 20, 528, 100);
        self.buttonTwo.frame = CGRectMake(20, 192, 528, 100);
    } else {
        self.viewLabel.frame = CGRectMake(121,20,79,21);
        self.buttonOne.frame = CGRectMake(20,58,280,180);
        self.buttonTwo.frame = CGRectMake(20,257,280,180);
    }
}

@end
