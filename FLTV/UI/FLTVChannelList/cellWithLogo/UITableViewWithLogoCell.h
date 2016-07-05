//
//  UITableViewWithLogoCell.h
//  LiveTVfree
//
//  Created by dRumyankov on 5/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewWithLogoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoChannel;
@property (weak, nonatomic) IBOutlet UILabel *nameChannel;
@property (weak, nonatomic) IBOutlet UILabel *televisionGIDChannel;

@end
