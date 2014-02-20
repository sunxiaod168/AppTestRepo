//
//  ViewController.h
//  HelloNoun
//
//  Created by 孙晓冬 on 14-2-20.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *userOutput;
@property (strong, nonatomic) IBOutlet UITextField *userInput;
- (IBAction)setOutput:(id)sender;



@end
