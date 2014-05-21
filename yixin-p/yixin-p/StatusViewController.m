//
//  StatusViewController.m
//  yixin-p
//
//  Created by 孙晓冬 on 14-5-8.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeStatus:(id)sender {
    UISegmentedControl *myStatus = (UISegmentedControl*)sender;
    int selectedIndex = myStatus.selectedSegmentIndex;
    IndexViewController *parent = (IndexViewController*)self.parentViewController;
    NSString *title = [myStatus titleForSegmentAtIndex:myStatus.selectedSegmentIndex];
    UILabel *statusTitle = parent.statusTitle;
    UIButton *statusColor = parent.statusColor;
    statusTitle.text = title;
    
    
    CGFloat freeColor[] = {63.0/255,200.0f/255,0,1};
    CGFloat busyColor[] = {230.0/255,0,18.0/255,1};
    CGFloat offlineColor[] = {98.0f/255,98.0f/255,98.0f/255,1};
    
    CGColorRef free = CGColorCreate(CGColorSpaceCreateDeviceRGB(), freeColor);
    CGColorRef busy = CGColorCreate(CGColorSpaceCreateDeviceRGB(), busyColor);
    CGColorRef offline = CGColorCreate(CGColorSpaceCreateDeviceRGB(), offlineColor);
    
    switch (selectedIndex) {
        case 0:
            statusColor.backgroundColor = [UIColor colorWithCGColor:free];
            break;
        case 1:
            statusColor.backgroundColor = [UIColor colorWithCGColor:busy];
            break;
        case 2:
            statusColor.backgroundColor = [UIColor colorWithCGColor:offline];
            break;
        default:
            break;
    }
}
@end
