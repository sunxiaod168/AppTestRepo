//
//  ViewController.m
//  Survey
//
//  Created by 孙晓冬 on 14-3-5.
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



- (IBAction)storeResults:(id)sender {
    NSString *csvLine = [NSString stringWithFormat:@"%@,%@,%@",self.firstName.text, self.lastName.text, self.email.text];
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
    if (! [[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        [[NSFileManager defaultManager] createFileAtPath:surveyFile contents:nil attributes:nil];
    }
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:surveyFile];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[csvLine dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
    
    self.firstName.text = @"";
    self.lastName.text = @"";
    self.email.text = @"";
}

- (IBAction)showResults:(id)sender {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:surveyFile];
        NSString *surveyResults = [[NSString alloc] initWithData:[fileHandle availableData] encoding:NSUTF8StringEncoding];
        [fileHandle closeFile];
        self.resultsView.text = surveyResults;
    }
    
    
}

- (IBAction)hideKeyboard:(id)sender {
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.email resignFirstResponder];
}
@end
