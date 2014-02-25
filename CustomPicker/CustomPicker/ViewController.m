//
//  ViewController.m
//  CustomPicker
//
//  Created by 孙晓冬 on 14-2-25.
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((AnimalChooserViewController *)segue.destinationViewController).delegate = self;
    
}

- (IBAction)showAnimalChooser:(id)sender {
    if (self.animalChooserVisible != YES) {
        [self performSegueWithIdentifier:@"toAnimalChooser" sender:sender];
        self.animalChooserVisible = YES;
    }
}

- (void)displayAnimal:(NSString *)choosenAnimal withSound:(NSString *)choosenSound fromComponent:(NSString *)choosenComponent{
    NSString *animalSoundString = [[NSString alloc] initWithFormat:@"You changed %@ (%@ and sound %@)", choosenComponent, choosenAnimal,choosenSound];
    self.outputLabel.text = animalSoundString;
}
@end
