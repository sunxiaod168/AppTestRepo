//
//  ViewController.m
//  Gestures
//
//  Created by 孙晓冬 on 14-3-7.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "ViewController.h"
#define kOriginWidth 125.0
#define kOriginHeight 115.0
#define kOriginX 100.0
#define kOriginY 330.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        self.outputLabel.text = @"Shaking things up!";
        self.imageView.transform = CGAffineTransformMakeRotation(0.0);
        self.imageView.frame = CGRectMake(kOriginX, kOriginY, kOriginWidth, kOriginHeight);
    }
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text = @"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
    self.outputLabel.text = @"Swiped";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedback;
    double scale;
    
    recognizer = (UIPinchGestureRecognizer *)sender;
    scale = recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    feedback = [[NSString alloc] initWithFormat:@"Pinched, Scale:%1.2f, Velocity:%1.2f", recognizer.scale, recognizer.velocity ];
    self.outputLabel.text = feedback;
    self.imageView.frame = CGRectMake(kOriginX, kOriginY, kOriginWidth * scale, kOriginHeight * scale);
}

- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedback;
    double rotation;
    
    recognizer = (UIRotationGestureRecognizer *)sender;
    rotation = recognizer.rotation;
    feedback = [[NSString alloc] initWithFormat:@"Rotated, Radians:%1.2f, Velocity:%1.2f", recognizer.rotation, recognizer.velocity ];
    self.outputLabel.text = feedback;
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
    
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}
@end














