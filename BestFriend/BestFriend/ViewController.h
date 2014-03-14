//
//  ViewController.h
//  BestFriend
//
//  Created by 孙晓冬 on 14-3-13.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate,MKMapViewDelegate,MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) MKPlacemark *zipAnnotation;


- (IBAction)newBFF:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)sendTweet:(id)sender;
- (void)centerMap:(NSString*)zipCode showAddress:(NSDictionary*)fullAddress;

@end
