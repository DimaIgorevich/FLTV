//
//  XMLParser.h
//  LiveTVfree
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLTVChannel.h"

@interface FLTVXMLParser : NSObject <NSXMLParserDelegate>{
    FLTVChannel *channel;
    NSString *currentString;
}

@property NSMutableArray<FLTVChannel *>* content;

//+ (NSArray<FLTVChanel *>*)content;

@end
