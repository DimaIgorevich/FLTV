//
//  FLTVChannelManager.h
//  FLTV
//
//  Created by dRumyankov on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLTVChannel.h"

@interface FLTVChannelManager : NSObject{
    NSArray <FLTVChannel *>*channelList;
}

@property (nonatomic, readonly) NSArray <FLTVChannel *>*channelList;

+ (id)sharedChannelManager;

@end
