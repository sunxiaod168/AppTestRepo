//
//  ViewController.m
//  ImageHop
//
//  Created by 孙晓冬 on 14-2-21.
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
    NSArray *hopAnimation;
    hopAnimation = [[NSArray alloc] initWithObjects:
    [UIImage imageNamed:@"frame-1.png"],
    [UIImage imageNamed:@"frame-2.png"],
    [UIImage imageNamed:@"frame-3.png"],
    [UIImage imageNamed:@"frame-4.png"],
    [UIImage imageNamed:@"frame-5.png"],
    [UIImage imageNamed:@"frame-6.png"],
    [UIImage imageNamed:@"frame-7.png"],
    [UIImage imageNamed:@"frame-8.png"],
    [UIImage imageNamed:@"frame-9.png"],
    [UIImage imageNamed:@"frame-10.png"],
    [UIImage imageNamed:@"frame-11.png"],
    [UIImage imageNamed:@"frame-12.png"],
    [UIImage imageNamed:@"frame-13.png"],
    [UIImage imageNamed:@"frame-14.png"],
    [UIImage imageNamed:@"frame-15.png"],
    [UIImage imageNamed:@"frame-16.png"],
    [UIImage imageNamed:@"frame-17.png"],
    [UIImage imageNamed:@"frame-18.png"],
    [UIImage imageNamed:@"frame-19.png"],
    [UIImage imageNamed:@"frame-10.png"],
    nil];
  
    self.bunnyView1.animationImages = hopAnimation;
    self.bunnyView2.animationImages = hopAnimation;
    self.bunnyView3.animationImages = hopAnimation;
    self.bunnyView4.animationImages = hopAnimation;
    self.bunnyView5.animationImages = hopAnimation;
    
    self.bunnyView1.animationDuration = 1;
    self.bunnyView2.animationDuration = 1;
    self.bunnyView3.animationDuration = 1;
    self.bunnyView4.animationDuration = 1;
    self.bunnyView5.animationDuration = 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleAnimation:(id)sender {
}

- (IBAction)setSpeed:(id)sender {
}

- (IBAction)setIncrement:(id)sender {
}
@end
