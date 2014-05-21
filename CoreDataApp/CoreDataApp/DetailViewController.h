//
//  DetailViewController.h
//  CoreDataApp
//
//  Created by 孙晓冬 on 14-5-12.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
