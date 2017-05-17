//
//  RecomTableCell.h
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUITableViewCell.h"

@interface RecomTableCell : BaseUITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *mTitle;

@end
