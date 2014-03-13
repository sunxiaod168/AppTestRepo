//
//  ViewController.m
//  BestFriend
//
//  Created by 孙晓冬 on 14-3-13.
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

- (IBAction)newBFF:(id)sender {
    ABPeoplePickerNavigationController *picker;
    picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)sendEmail:(id)sender {
}

- (IBAction)sendTweet:(id)sender {
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    NSString *friendName;
    NSString *friendEmail;
    NSString *friendZip;
    
    friendName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    self.name.text = friendName;
    
    ABMultiValueRef friendAddressSet;
    NSDictionary *friendFirstAddress;
    friendAddressSet = ABRecordCopyValue(person, kABPersonAddressProperty);
    
    if (ABMultiValueGetCount(friendAddressSet) > 0) {
        friendFirstAddress = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(friendAddressSet, 0);
        friendZip = [friendFirstAddress objectForKey:@"ZIP"];
    }
    
    ABMultiValueRef friendEmailAddress;
    friendEmailAddress = ABRecordCopyValue(person, kABPersonEmailProperty);
    
    if (ABMultiValueGetCount(friendEmailAddress) > 0) {
        friendEmail = (__bridge NSString *)ABMultiValueCopyValueAtIndex(friendEmailAddress, 0);
        self.email.text = friendEmail;
    }
    
    if (ABPersonHasImageData(person)) {
        self.photo.image = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageData(person)];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    return NO;
    
    
}
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end



















