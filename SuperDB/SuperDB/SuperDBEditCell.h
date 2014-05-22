//
//  SuperDBEditCell.h
//  SuperDB
//
//  Created by 孙晓冬 on 14-5-22.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperDBEditCell : UITableViewCell
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField * textField;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;


@end
