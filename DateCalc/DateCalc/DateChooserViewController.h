//
//  DateChooserViewController.h
//  DateCalc
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DateChooserViewController : UIViewController
@property (strong, nonatomic) id delegate;
- (IBAction)dismissDateChooser:(id)sender;
- (IBAction)setDateTime:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
