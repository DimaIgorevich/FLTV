//
//  XMLParser.m
//  LiveTVfree
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "FLTVXMLParser.h"

@implementation FLTVXMLParser

- (id)init{
    if(self = [super init]){
        _content = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidStartDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"didStartElement --> %@", elementName);
    
    if([elementName isEqualToString:@"channel"]){
        channel = nil;
        channel = [[FLTVChannel alloc] init];
        
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"foundCharacters --> %@", string);
    currentString = nil;
    currentString = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
     NSLog(@"didEndElement   --> %@", elementName);
    
    if([elementName isEqualToString:@"channel_name"]){
        channel.nameChanel = currentString;
    }
    
    if([elementName isEqualToString:@"channel_path"]){
        channel.pathChanel = currentString;
    }
    
    if([elementName isEqualToString:@"channel_logo"]){
        [channel loadLogo:currentString];
    }
    
    if([elementName isEqualToString:@"channel"]){
        [_content addObject:channel];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidEndDocument");
}

@end
