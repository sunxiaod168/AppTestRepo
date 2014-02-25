//
//  ViewController.h
//  PopoverEditor
//
//  Created by 孙晓冬 on 14-2-24.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"

@interface ViewController : UIViewController <UIPopoverControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

@end
