//
//  HotDesignTableCell.m
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import "HotDesignTableCell.h"
#import "HotDesignCollectionViewCell.h"
#import "UIImageView+WebCache.h"

static NSString *IDENTIFIER = @"identifier";

@implementation HotDesignTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.heightCell = self.frame.size.height;
    
    self.mCollectionView.dataSource = self;
    self.mCollectionView.delegate = self;
    [self.mCollectionView registerNib:[UINib nibWithNibName:@"HotDesignCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:IDENTIFIER];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotDesignCollectionViewCell *cell;
    cell = (HotDesignCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:IDENTIFIER forIndexPath:indexPath];
    [cell.mImageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg"]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat minLineSpace = ((UICollectionViewFlowLayout*)collectionViewLayout).minimumLineSpacing;
//    CGFloat fWidth = collectionView.frame.size.width;
//    CGFloat widht = (fWidth - 5*minLineSpace)/6;
//    CGSize size = CGSizeMake(widht, widht);
    CGSize size = CGSizeMake(collectionView.frame.size.height, collectionView.frame.size.height);
    return size;
}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 10, 0, 10);
//}

@end
