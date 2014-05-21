//
//  IndexViewController.m
//  yixin-p
//
//  Created by 孙晓冬 on 14-5-6.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

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
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    //self.automaticallyAdjustsScrollViewInsets = YES;
    //self.extendedLayoutIncludesOpaqueBars = YES;
    //[self.scrollView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    
    //设置导航条右按钮
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"setting.png"];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goSetting) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y, buttonImage.size.width/2.0, buttonImage.size.height/2.0)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    //设置导航条title为图片
    UIImage *titleImage = [UIImage imageNamed:@"yixin.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    titleImageView.frame = CGRectMake(titleImageView.frame.origin.x,titleImageView.frame.origin.y,
                                 titleImage.size.width/2.0, titleImage.size.height/2.0);
    UIImageView *aroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(titleImageView.frame.origin.x,titleImageView.frame.origin.y,titleImage.size.width/2.0, titleImage.size.height/2.0)];
    [aroundImageView addSubview:titleImageView];
    self.navigationItem.titleView = aroundImageView;
    
    
    //设置firstSection边框
    CGFloat borderColor[] = {0.867f,0.867f,0.867f,1};
    CGColorRef border = CGColorCreate(CGColorSpaceCreateDeviceRGB(), borderColor);
    [self.firstSection.layer setBorderColor:border];
    [self.firstSection.layer setBorderWidth:1.0f];
    
    //设置scrollView
    self.scrollView.contentSize = CGSizeMake(320.0, 800.0);
    
    self.statusView.hidden = YES;
    self.statusView.layer.cornerRadius = 5;

    //test

    
}
- (void)goSetting{
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SettingViewController * settingVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"setting"];
//    settingVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:settingVC animated:YES completion:nil];
    
    [self performSegueWithIdentifier:@"toSetting" sender:self];
    
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



- (IBAction)changeStatus:(id)sender forEvent:(UIEvent *)event {
    //self.statusView.hidden = NO;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    NSSet *set = event.allTouches;
    UITouch *touch = [set anyObject];
    CGPoint point1 = [touch locationInView:window];
    //    CGPoint point = sender.center;
    [KWPopoverView showPopoverAtPoint:point1 inView:self.view withContentView:self.statusView];
}

- (IBAction)OpenTestView:(id)sender {
    [self performSegueWithIdentifier:@"toQRView" sender:self];
}

- (IBAction)closeTestView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

