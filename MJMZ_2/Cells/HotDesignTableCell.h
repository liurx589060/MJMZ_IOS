//
//  HotDesignTableCell.h
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUITableViewCell.h"

@interface HotDesignTableCell : BaseUITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;

@end
