//
//  ViewController.m
//  MediaPlayground
//
//  Created by 孙晓冬 on 14-3-9.
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
    
    NSString *movieFile = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"m4v"];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:movieFile]];
    self.moviePlayer.allowsAirPlay = YES;
    [self.moviePlayer.view setFrame:CGRectMake(119.0, 20.0, 180.0, 120.0)];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
    NSDictionary *soundSetting;
    soundSetting = [NSDictionary dictionaryWithObjectsAndKeys:
                    [NSNumber numberWithFloat:44100.0],AVSampleRateKey,
                    [NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,
                    [NSNumber numberWithInt:2],AVNumberOfChannelsKey,
                    [NSNumber numberWithInt:AVAudioQualityHigh], AVEncoderAudioQualityKey, nil];
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:soundSetting error:nil];
    
    NSURL *noSoundFileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"norecording" ofType:@"wav"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:noSoundFileURL error:nil];
    
    self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    [self.view addSubview:self.moviePlayer.view];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playMovieFinished:) name:@"MPMoviePlayerPlaybackDidFinishNotification" object:self.moviePlayer];
    if ([self.toggleFullScreen isOn]) {
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    [self.moviePlayer play];
}

- (IBAction)recordButton:(id)sender {
    if ([self.recordButton.titleLabel.text isEqualToString:@"Record Audio"]) {
        [self.audioRecorder record];
        [self.recordButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
    } else {
        [self.audioRecorder stop];
        [self.recordButton setTitle:@"Record Audio" forState:UIControlStateNormal];
        
        NSURL *soundFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        
    }
}

- (IBAction)playAudio:(id)sender {
    [self.audioPlayer play];
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    imagePicker.delegate = self;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
    self.displayImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)applyFilter:(id)sender {
    CIImage *imageToFilter;
    imageToFilter = [[CIImage alloc] initWithImage:self.displayImageView.image];
    CIFilter *activeFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [activeFilter setDefaults];
    [activeFilter setValue:[NSNumber numberWithFloat:0.75] forKey:@"inputIntensity"];
    [activeFilter setValue:imageToFilter forKey:@"inputImage"];
    CIImage *filteredImage = [activeFilter valueForKey:@"outputImage"];
    UIImage *myNewImage = [UIImage imageWithCIImage:filteredImage];
    self.displayImageView.image = myNewImage;
    
}

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
    [self.musicPlayer stop];
    self.displayNowPlaying.text = @"No Song Playing";
    [self.musicPlayButton setTitle:@"Play Music" forState:UIControlStateNormal];
    musicPicker =[[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    musicPicker.prompt = @"Choose Songs to Play";
    musicPicker.allowsPickingMultipleItems = YES;
    musicPicker.delegate = self;
    [self presentViewController:musicPicker animated:YES completion:nil];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    [self.musicPlayer setQueueWithItemCollection:mediaItemCollection];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text isEqualToString:@"Play Music"]) {
        [self.musicPlayer play];
        [self.musicPlayButton setTitle:@"Pause Music" forState:UIControlStateNormal];
        self.displayNowPlaying.text = [self.musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
    } else {
        [self.musicPlayer pause];
        [self.musicPlayButton setTitle:@"Play Music" forState:UIControlStateNormal];
        self.displayNowPlaying.text = @"No Song Playing";
    }
}

- (void)playMovieFinished:(NSNotification *)theNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MPMoviePlayerPlaybackDidFinishNotification" object:self.moviePlayer];
    [self.moviePlayer.view removeFromSuperview];
}












@end
