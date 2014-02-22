//
//  ViewController.h
//  FlowerWeb
//
//  Created by 孙晓冬 on 14-2-22.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (strong, nonatomic) IBOutlet UIWebView *flowerView;
@property (strong, nonatomic) IBOutlet UIWebView *flowerViewDetail;
- (IBAction)getFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;

@end
