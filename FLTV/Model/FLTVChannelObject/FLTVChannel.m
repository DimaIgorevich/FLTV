//
//  FLTVChanel.m
//  LiveTVfree
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FLTVChannel.h"

#define kEMPTY_LOGO_CHANNEL @"channel_icon.png"

@implementation FLTVChannel

- (void)loadLogo:(NSString *)pathLogoChannel{

    if(pathLogoChannel.length > 0){
        NSData * logoData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: pathLogoChannel]];
        if(logoData != nil){
            self.logoChannel = [UIImage imageWithData: logoData];
        } else {
            self.logoChannel = [UIImage imageNamed: kEMPTY_LOGO_CHANNEL];
        }
    }
}

@end
