//
//  ViewController.m
//  GettingAttention
//
//  Created by 孙晓冬 on 14-2-23.
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

- (IBAction)doAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button Selected" message:@"I need your attention now!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil , nil];
    [alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button selected" message:@"I need attention NOW!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Maybe Later",@"Never", nil];
    [alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Email Address" message:@"Please enter your email address:" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil , nil];
    alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertDialog show];

}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Available Actions" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destroy" otherButtonTitles:@"Negotiate",@"Compromise", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showFromRect:[(UIButton *) sender frame] inView:self.view animated:YES];
    
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"soundeffect" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Maybe Later"]) {
        self.userOutput.text = @"Clicked 'Maybe Later'";
    }else if([buttonTitle isEqualToString:@"Never"]){
        self.userOutput.text = @"Clicked 'Never'";
    }else{
        self.userOutput.text = @"Clicked 'Ok'";
    }
    if ([alertView.title isEqualToString:@"Email Address"]) {
        self.userOutput.text = [[alertView textFieldAtIndex:0] text];
    }
    
}
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    self.userOutput.text = [@"Clicked '" stringByAppendingFormat: @"%@%@",buttonTitle, @"'"];
}
@end
