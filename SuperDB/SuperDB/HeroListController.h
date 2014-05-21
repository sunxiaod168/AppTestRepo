//
//  HeroListController.h
//  SuperDB
//
//  Created by 孙晓冬 on 14-5-16.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kSelectedTabDefaultsKey @"Selected Tab"

enum {
    kByName,
    kBySecretIdentity
};

@interface HeroListController : UIViewController <UITableViewDataSource,UITabBarDelegate,NSFetchedResultsControllerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *heroTableView;
@property (strong, nonatomic) IBOutlet UITabBar *heroTabBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)addHero:(id)sender;

@end
