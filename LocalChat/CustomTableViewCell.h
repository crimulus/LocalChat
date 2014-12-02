//
//  CustomTableViewCell.h
//  LocalChat
//
//  Created by Tharp, Jeremy on 12/1/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet UIImageView *theImage;

@end
