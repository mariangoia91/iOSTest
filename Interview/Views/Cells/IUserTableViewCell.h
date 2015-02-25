//
//  IUserTableViewCell.h
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IUserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *statusIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusMessageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImageView;

@end
