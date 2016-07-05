//
//  FLTVChanel.h
//  LiveTVfree
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FLTVChannel : NSObject

@property NSString *nameChanel;
@property NSString *pathChanel;
@property UIImage *logoChannel;

- (void)loadLogo:(NSString *)pathLogoChannel;

@end
