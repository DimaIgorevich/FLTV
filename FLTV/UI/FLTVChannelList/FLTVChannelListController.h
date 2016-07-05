//
//  FLTVChannelListController.h
//  LiveTVfree
//
//  Created by dRumyankov on 5/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLTVChannel.h"

@interface FLTVChannelListController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSIndexPath *indexSelectedItem_;
}

@end
