//
//  ViewController.h
//  FlowerColorTable
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *redFlowers;
@property (strong, nonatomic) NSArray *blueFlower;


@end
