//
//  FLTVChannelManager.m
//  FLTV
//
//  Created by dRumyankov on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FLTVChannelManager.h"
#import "FLTVXMLParser.h"

#define kNameChannelList @"chanelList"
#define kTypeFileXML @"xml"

@implementation FLTVChannelManager

@synthesize channelList;

+ (id)sharedChannelManager{
    static FLTVChannelManager *sharedChannelManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedChannelManager = [[self alloc] init];
    });
    return sharedChannelManager;
}

- (id)init{
    if(self = [super init]){
        channelList = [self loadChannelList];
        for(FLTVChannel *objectChanel in channelList){
            NSLog(@"%@ - %@", objectChanel.nameChanel, objectChanel.pathChanel);
        }
        NSLog(@"Count channel in load list %d", (int)channelList.count);
    }
    return  self;
}

- (NSArray <FLTVChannel *>*)loadChannelList{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:kNameChannelList ofType:kTypeFileXML]];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    FLTVXMLParser *parserDelegate = [[FLTVXMLParser alloc] init];
    [parser setDelegate:parserDelegate];
    [parser parse];
    
    return parserDelegate.content;
}

@end
