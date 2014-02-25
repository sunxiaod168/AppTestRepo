//
//  ViewController.m
//  DateCalc
//
//  Created by 孙晓冬 on 14-2-25.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDateChooser:(id)sender {
    if (self.dateChooserVisible != YES) {
        [self performSegueWithIdentifier:@"toDateChooser" sender:sender];
        self.dateChooserVisible = YES;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((DateChooserViewController *)segue.destinationViewController).delegate = self;
}

- (void) calculateDateDifference:(NSDate *)chosenDate{
    NSDate *today;
    NSString *differenceOutput;
    NSString *todaysDateString;
    NSString *chosenDateString;
    NSDateFormatter *dateFormatter;
    NSTimeInterval difference;
    
    today = [NSDate date];
    difference = [today timeIntervalSinceDate:chosenDate] / 86400;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM d, yyyy hh:mm:ssa"];
    todaysDateString = [dateFormatter stringFromDate:today];
    chosenDateString = [dateFormatter stringFromDate:chosenDate];
    differenceOutput = [[NSString alloc] initWithFormat:@"Difference between chosen date(%@) and today(%@) in days: %1.2f",chosenDateString,todaysDateString,fabs(difference)];
    self.outputLabel.text = differenceOutput;
    
}
@end
