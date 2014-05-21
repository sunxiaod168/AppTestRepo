//
//  TestViewController.h
//  yixin-p
//
//  Created by 孙晓冬 on 14-5-8.
//  Copyright (c) 2014年 Jack Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../ZBarSDK/Headers/ZBarSDK/ZBarSDK.h"

@interface QRViewController : UIViewController<ZBarReaderDelegate>
- (IBAction)closeTestView:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *qrInfo;

@property (strong, nonatomic) IBOutlet UIImageView *resultImage;
@property (strong, nonatomic) IBOutlet UITextView *resultText;

- (IBAction)scan:(id)sender;


@end
