//
//  SettingViewController.m
//  yixin-p
//
//  Created by 孙晓冬 on 14-5-6.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    
    self.docName.text = ((NavigationController*)self.parentViewController).docName;
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"backbutton.png"];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y, buttonImage.size.width/2.0, buttonImage.size.height/2.0)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)goback{
   [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
