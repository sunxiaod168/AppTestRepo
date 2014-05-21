//
//  ViewController.m
//  SlowCount
//
//  Created by 孙晓冬 on 14-3-18.
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
    counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
    }];
    count = 0;
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
}

- (void)countUp{
    if (count == 1000) {
        [self.theTimer invalidate];
        [self setTheTimer:nil];
        [[UIApplication sharedApplication] endBackgroundTask:counterTask];
    }else{
        count++;
        NSString *currentCount;
        currentCount = [[NSString alloc] initWithFormat:@"%d",count ];
        self.theCount.text = currentCount;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
