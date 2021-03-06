//
//  ViewController.h
//  DateCalc
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) BOOL dateChooserVisible;
- (void) calculateDateDifference: (NSDate *) chosenDate;
- (IBAction)showDateChooser:(id)sender;

@end
