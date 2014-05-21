//
//  ViewController.h
//  SlowCount
//
//  Created by 孙晓冬 on 14-3-18.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int count;
    UIBackgroundTaskIdentifier counterTask;
}
@property (strong, nonatomic) IBOutlet UILabel *theCount;
@property (strong, nonatomic) NSTimer *theTimer;

- (void)countUp;



@end
