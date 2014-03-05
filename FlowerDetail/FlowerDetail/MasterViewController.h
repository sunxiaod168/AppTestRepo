//
//  MasterViewController.h
//  FlowerDetail
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *flowerData;
@property (strong, nonatomic) NSArray *flowerSections;

- (void) createFlowerData;

@end
