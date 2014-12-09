//
//  ConnectViewController.h
//  LocalChat
//
//  Created by Tharp, Jeremy on 11/24/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ConnectViewController : UIViewController
    <UITableViewDataSource,
     UITableViewDelegate,
     MCBrowserViewControllerDelegate>
{
    AppDelegate *appDelegate;
}
@property (nonatomic, strong) NSArray *connectedPeers;

@end
