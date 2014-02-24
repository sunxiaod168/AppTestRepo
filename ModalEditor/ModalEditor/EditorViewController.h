//
//  EditorViewController.h
//  ModalEditor
//
//  Created by 孙晓冬 on 14-2-24.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)dismissEditor:(id)sender;

@end
