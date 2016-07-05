//
//  FLTVPreloader.m
//  FLTV
//
//  Created by dRumyankov on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FLTVPreloader.h"
#import "FLTVChannelManager.h"

@implementation FLTVPreloader

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    
    [self prepareForStartApplication];
}

- (void)prepareForStartApplication{
    NSLog(@"prepare");
    [FLTVChannelManager sharedChannelManager];
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(finishLoad) userInfo:nil repeats:NO];
}

- (void)finishLoad{
    if([[FLTVChannelManager sharedChannelManager] channelList] != nil){
        [self performSegueWithIdentifier:@"toListChannel" sender:self];
    }
}

@end
