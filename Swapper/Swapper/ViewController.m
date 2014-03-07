//
//  ViewController.m
//  Swapper
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

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = self.landscapeView;
        self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * 90);
        self.view.bounds = CGRectMake(0.0, 0.0, 480, 300);
    } else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        self.view = self.landscapeView;
        self.view.transform = CGAffineTransformMakeRotation(kDeg2Rad * -90);
        self.view.bounds = CGRectMake(0.0, 0.0, 480, 300);
        
    }else{
        self.view = self.portraitView;
        self.view.transform = CGAffineTransformMakeRotation(0);
        self.view.bounds = CGRectMake(0.0, 0.0, 320, 460);
        
    }
}

@end
