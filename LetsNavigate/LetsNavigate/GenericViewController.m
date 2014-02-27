//
//  GenericViewController.m
//  LetsNavigate
//
//  Created by 孙晓冬 on 14-2-27.
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

- (void)viewWillAppear:(BOOL)animated{
    NSString *count = [[NSString alloc] initWithFormat:@"%d",((CountingNavitionController *)self.parentViewController).pushCount];
    self.countLabel.text = count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementCount:(id)sender {
    ((CountingNavitionController *)self.parentViewController).pushCount++;
}
@end
