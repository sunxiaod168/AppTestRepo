//
//  ViewController.m
//  PopoverEditor
//
//  Created by 孙晓冬 on 14-2-24.
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
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIStoryboardPopoverSegue *popoverSegue;
    popoverSegue = (UIStoryboardPopoverSegue *)segue;
    
    UIPopoverController *popoverController;
    popoverController = popoverSegue.popoverController;
    popoverController.delegate = self;
    
    EditorViewController *editorVC;
    editorVC = (EditorViewController *) popoverController.contentViewController;
    editorVC.emailField.text = self.emailLabel.text;
}
- (void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    NSString *newEmail = ((EditorViewController *)popoverController.contentViewController).emailField.text;
    self.emailLabel.text = newEmail;
}
@end
