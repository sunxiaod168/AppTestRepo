//
//  ViewController.m
//  Scroller
//
//  Created by 孙晓冬 on 14-2-22.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    self.theScroller.contentSize = CGSizeMake(240.0, 600.0);
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
