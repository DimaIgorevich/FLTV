//
//  LTVDisplayController.m
//  LiveTVfree
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FLTVPlayerController.h"



@implementation FLTVPlayerController

- (void)setTreadChanel:(NSString *)pathChanel{
    self.videoURL = [NSURL URLWithString:pathChanel];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.navigationController.navigationBarHidden = YES;
    
    [self preparePlayer];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)preparePlayer{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDonePressed:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];

    self.videoController.controlStyle = MPMovieControlStyleFullscreen;
    self.videoController.scalingMode = MPMovieScalingModeAspectFit;
    self.videoController.shouldAutoplay = YES;
    [self.videoController prepareToPlay];
    
    CGSize parrentFrame = self.view.frame.size;
    [self.videoController.view setFrame:CGRectMake (0, 0, parrentFrame.width, parrentFrame.height)];
    
    [self.videoController play];
    
    if([self.view.subviews indexOfObject:self.videoController.view] != NSNotFound){
        [self.videoController.view removeFromSuperview];
    }
    
    [self.view addSubview:self.videoController.view];
    
    [self.videoController setFullscreen:YES];

}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    [self.videoController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self willRotateToInterfaceOrientation:orientation duration:1.0];
}

- (void)moviePlayBackDonePressed:(NSNotification *)notification
{
    
    [self.videoController stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    self.videoController = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}


@end
