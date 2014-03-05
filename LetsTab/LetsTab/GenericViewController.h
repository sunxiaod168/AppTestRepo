//
//  GenericViewController.h
//  LetsTab
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingTabBarController.h"

@interface GenericViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UITabBarItem *barItem;

- (IBAction)incrementCountFirst:(id)sender;
- (IBAction)incrementCountSecond:(id)sender;
- (IBAction)incrementCountThird:(id)sender;

- (void)updateCounts;
- (void)updateBadge;
- (void)update;


@end
