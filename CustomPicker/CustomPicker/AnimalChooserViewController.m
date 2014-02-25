//
//  AnimalChooserViewController.m
//  CustomPicker
//
//  Created by 孙晓冬 on 14-2-25.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "AnimalChooserViewController.h"

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1

@interface AnimalChooserViewController ()

@end

@implementation AnimalChooserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.animalNames = [[NSArray alloc] initWithObjects:@"Mouse",@"Goose",@"Cat",@"Dog",@"Snake", @"Bear",@"Pig", nil];
    self.animalSounds = [[NSArray alloc] initWithObjects:@"Oink",@"Rawr", @"Ssss", @"Roof", @"Meow", @"Honk", @"Squeak", nil];
    self.animalImages = [[NSArray alloc] initWithObjects:
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]], nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated{
    ((ViewController *)self.delegate).animalChooserVisible = NO;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return kComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kAnimalComponent) {
        return [self.animalNames count];
    }else{
        return [self.animalSounds count];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component == kAnimalComponent) {
        // self.myImages is an array of UIImageView objects
        UIView * myView = [self.animalImages objectAtIndex:row];
        
        // first convert to a UIImage
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
        
        [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        // then convert back to a UIImageView and return it
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        return imageView;
        
        //return [self.animalImages objectAtIndex:row];
    }else{
        UILabel *soundLabel;
        soundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
        soundLabel.backgroundColor = [UIColor clearColor];
        soundLabel.text = [self.animalSounds objectAtIndex:row];
        return soundLabel;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 55.0;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == kAnimalComponent) {
        return 75.0;
    }else{
        return 150.0;
    }
}






@end
