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
    MFMailComposeViewController *mailCompose;
    NSArray *emailAddresses;
    emailAddresses = [[NSArray alloc]initWithObjects:self.email.text, nil];
    
    mailCompose = [[MFMailComposeViewController alloc] init];
    mailCompose.mailComposeDelegate = self;
    [mailCompose setToRecipients:emailAddresses];
    [self presentViewController:mailCompose animated:YES completion:nil];
    
}

- (IBAction)sendTweet:(id)sender {
    TWTweetComposeViewController *tweetComposer;
    tweetComposer = [[TWTweetComposeViewController alloc] init];
    if ([TWTweetComposeViewController canSendTweet]) {
        [tweetComposer setInitialText:@"I'm on my way."];
        [self presentViewController:tweetComposer animated:YES completion:nil];
    }
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
        [self centerMap:friendZip showAddress:friendFirstAddress];
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

- (void)centerMap:(NSString *)zipCode showAddress:(NSDictionary *)fullAddress{
    NSString *queryURL;
    NSString *queryResult;
    NSArray *queryData;
    double latitude;
    double longitude;
    MKCoordinateRegion mapRegion;
    
    queryURL = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps/api/geocode/json?address=cn-100084&sensor=false%@",zipCode];
    queryResult = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:queryURL] encoding:NSUTF8StringEncoding error:nil];
    queryData = [queryResult componentsSeparatedByString:@","];
    
    if ([queryData count] == 4) {
        latitude = [[queryData objectAtIndex:2] doubleValue];
        longitude = [[queryData objectAtIndex:3] doubleValue];
        mapRegion.center.latitude = latitude;
        mapRegion.center.longitude = longitude;
        mapRegion.span.latitudeDelta = 0.2;
        mapRegion.span.longitudeDelta = 0.2;
        [self.map setRegion:mapRegion animated:YES];
        
        if (self.zipAnnotation != nil) {
            [self.map removeAnnotation:self.zipAnnotation];
        }
        self.zipAnnotation = [[MKPlacemark alloc] initWithCoordinate:mapRegion.center addressDictionary:fullAddress];
        [self.map addAnnotation:self.zipAnnotation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView *pinDrop = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myspot"];
    pinDrop.animatesDrop = YES;
    pinDrop.canShowCallout = YES;
    pinDrop.pinColor = MKPinAnnotationColorPurple;
    return pinDrop;
}


@end



















