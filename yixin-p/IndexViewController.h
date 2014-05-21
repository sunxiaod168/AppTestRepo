//
//  IndexViewController.h
//  yixin-p
//
//  Created by 孙晓冬 on 14-5-6.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"
#import "SettingViewController.h"
#import "StatusViewController.h"
#import "KWPopoverView.h"


@interface IndexViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *indexNavigation;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *firstSection;
@property (strong, nonatomic) IBOutlet UILabel *statusTitle;
@property (strong, nonatomic) IBOutlet UIButton *statusColor;
@property (strong, nonatomic) IBOutlet UIView *statusView;

- (IBAction)changeStatus:(id)sender forEvent:(UIEvent *)event;





- (IBAction)OpenTestView:(id)sender;
- (IBAction)closeTestView:(id)sender;




@end
