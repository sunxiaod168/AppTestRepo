//
//  ViewController.m
//  DebuggerPractice
//
//  Created by 孙晓冬 on 14-3-20.
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
    
    NSString *description;
    NSLog(@"Start");
    
    for (int i = 1; i <= 2000; i++) {
        description = [self describeInteger:i];
        NSLog(@"Variables: i - %d and description - %@", i, description);
        NSLog(@"----------------");
    }
    
    NSLog(@"Done");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)describeInteger:(int)i{
    if (i % 2 == 0) {
        return @"even";
    }else{
        return @"odd";
    }
}

@end
