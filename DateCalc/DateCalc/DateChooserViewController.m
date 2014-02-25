//
//  DateChooserViewController.m
//  DateCalc
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()

@end

@implementation DateChooserViewController

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
- (void) viewDidAppear:(BOOL)animated{
    
    [(ViewController *)self.delegate calculateDateDifference:[NSDate date]];
    
}

-(void) viewWillDisappear:(BOOL)animated{
    ((ViewController *)self.delegate).dateChooserVisible = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender {
    [((ViewController *)self.delegate) calculateDateDifference:((UIDatePicker *)sender).date];
}
@end
