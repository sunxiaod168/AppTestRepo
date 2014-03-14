//
//  ViewController.h
//  MediaPlayground
//
//  Created by 孙晓冬 on 14-3-9.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <CoreImage/CoreImage.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UISwitch *toggleFullScreen;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView;
@property (strong, nonatomic) IBOutlet UIButton *musicPlayButton;
@property (strong, nonatomic) IBOutlet UILabel *displayNowPlaying;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) MPMusicPlayerController *musicPlayer;

- (IBAction)playMovie:(id)sender;
- (IBAction)recordButton:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseImage:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)chooseMusic:(id)sender;
- (IBAction)playMusic:(id)sender;


@end
