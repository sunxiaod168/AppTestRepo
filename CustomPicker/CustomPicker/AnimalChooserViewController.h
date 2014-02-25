//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic) id delegate;
@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;

@end
