//
//  ViewController.h
//  CustomPicker
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) BOOL animalChooserVisible;

- (IBAction)showAnimalChooser:(id)sender;
- (void)displayAnimal:(NSString *)choosenAnimal withSound:(NSString *)choosenSound fromComponent:(NSString *)choosenComponent;

@end
