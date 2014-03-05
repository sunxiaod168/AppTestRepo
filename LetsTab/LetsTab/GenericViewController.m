//
//  GenericViewController.m
//  LetsTab
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateCounts];
}

- (IBAction)incrementCountFirst:(id)sender {
    ((CountingTabBarController *)self.parentViewController).firstCount++;
    [self update];
}

- (IBAction)incrementCountSecond:(id)sender {
    ((CountingTabBarController *)self.parentViewController).secondCount++;
    [self update];
}

- (IBAction)incrementCountThird:(id)sender {
    ((CountingTabBarController *)self.parentViewController).thirdCount++;
    [self update];
}

- (void)update{
    [self updateBadge];
    [self updateCounts];
}

- (void)updateCounts {
    NSString *countsString = [[NSString alloc] initWithFormat:@"First:%d\nSecond:%d\nThird:%d\n",
                              ((CountingTabBarController *)self.parentViewController).firstCount,
                              ((CountingTabBarController *)self.parentViewController).secondCount,
                              ((CountingTabBarController *)self.parentViewController).thirdCount];
    self.countLabel.text = countsString;
}

- (void)updateBadge {
    NSString *badgeCount;
    int currentBadge;
    currentBadge = [self.barItem.badgeValue intValue];
    currentBadge++;
    badgeCount = [[NSString alloc] initWithFormat:@"%d",currentBadge];
    self.barItem.badgeValue = badgeCount;
    
}
@end




























