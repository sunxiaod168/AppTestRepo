//
//  ViewController.m
//  FlowerWeb
//
//  Created by 孙晓冬 on 14-2-22.
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
    self.flowerViewDetail.hidden = YES;
    [self getFlower:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFlower:(id)sender {
    NSURL *imageURL;
    NSURL *detailURL;
    NSString *imageURLString;
    NSString *detailURLString;
    NSString *color;
    int sessionID;
    
    color = [self.colorChoice titleForSegmentAtIndex:self.colorChoice.selectedSegmentIndex];
    sessionID = random() % 50000;
    imageURLString = [[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/showrandomios.php?color=%@&sessionid=%d",color,sessionID];
    detailURLString = [[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/detailios.php?sessionid=%d",sessionID];
    imageURL = [[NSURL alloc] initWithString:imageURLString];
    detailURL = [[NSURL alloc] initWithString:imageURLString];
    [self.flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
    [self.flowerViewDetail loadRequest:[NSURLRequest requestWithURL:detailURL]];
    self.flowerViewDetail.backgroundColor = [UIColor clearColor];
    
    
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerViewDetail.hidden = ![sender isOn];
}
@end
