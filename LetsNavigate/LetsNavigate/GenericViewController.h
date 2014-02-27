//
//  GenericViewController.h
//  LetsNavigate
//
//  Created by 孙晓冬 on 14-2-27.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingNavitionController.h"

@interface GenericViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *countLabel;


- (IBAction)incrementCount:(id)sender;

@end
