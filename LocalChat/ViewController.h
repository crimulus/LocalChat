//
//  ViewController.h
//  LocalChat
//
//  Created by Tharp, Jeremy on 11/20/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <UITextFieldDelegate,
                                              UITableViewDataSource>
{
}

@property (weak, nonatomic) IBOutlet UIView         *textEntryView;
@property (weak, nonatomic) IBOutlet UITextField    *textEntry;
@property (weak, nonatomic) IBOutlet UIButton       *textSendButton;
@property (weak, nonatomic) IBOutlet UIScrollView   *messagesScrollView;
@property (weak, nonatomic) IBOutlet UITextView     *messagesTextView;

@property AppDelegate *appDelegate;

@end

