//
//  ViewController.m
//  HelloNoun
//
//  Created by 孙晓冬 on 14-2-20.
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

- (IBAction)setOutput:(id)sender {
    self.userOutput.text = self.userInput.text;
}


- (IBAction)done:(id)sender {
   self.userOutput.text = self.userInput.text;
}
@end
