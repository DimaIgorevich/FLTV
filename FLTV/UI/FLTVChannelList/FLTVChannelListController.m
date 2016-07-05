//
//  FLTVChannelListController.m
//  LiveTVfree
//
//  Created by dRumyankov on 5/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#define kMainTitle @"FLTV"
#define kIdentifierCellWithLogo @"cellWithLogo"

#import "FLTVChannelManager.h"
#import "FLTVChannelListController.h"
#import "FLTVPlayerController.h"
#import "UITableViewWithLogoCell.h"

const CGFloat kHeightRow = 100.0f;


@implementation FLTVChannelListController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = kMainTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHeightRow;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[FLTVChannelManager sharedChannelManager] channelList].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray <FLTVChannel *>*channelList = [[FLTVChannelManager sharedChannelManager] channelList];
    FLTVChannel *itemChannel = [channelList objectAtIndex:indexPath.row];
    
    UITableViewWithLogoCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifierCellWithLogo];
    
    cell.logoChannel.image = itemChannel.logoChannel;
    [cell.nameChannel setText: itemChannel.nameChanel];
    [cell.televisionGIDChannel setText:@"subinfo"];
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    indexSelectedItem_ = indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self performSegueWithIdentifier:@"toPlayer" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toPlayer"]){
        
        NSArray <FLTVChannel *>*channelList = [[FLTVChannelManager sharedChannelManager] channelList];
        FLTVChannel *selectedChanel = [channelList objectAtIndex:indexSelectedItem_.row];
        
        [segue.destinationViewController setTreadChanel:selectedChanel.pathChanel];
    }
}

@end
