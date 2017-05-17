//
//  BannerTableCell.h
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "BaseUITableViewCell.h"

@interface BannerTableCell : BaseUITableViewCell<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *mSDCycleBanner;

@end
