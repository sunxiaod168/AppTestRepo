//
//  EditorViewController.m
//  ModalEditor
//
//  Created by 孙晓冬 on 14-2-24.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

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
    self.emailField.text = ((ViewController *) self.presentingViewController).emailLabel.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissEditor:(id)sender {
    ((ViewController *) self.presentingViewController).emailLabel.text = self.emailField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
