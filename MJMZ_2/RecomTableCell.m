//
//  RecomTableCell.m
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import "RecomTableCell.h"
#import "UIImageView+WebCache.h"

@implementation RecomTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.heightCell = self.frame.size.height;
    [self.mImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494937061411&di=47785aaca42f84b68b38c5552c19755e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3D2441c47fd709b3deebbfe460fcbf6cd3%2F4b0a0a7b02087bf478de34fef4d3572c11dfcf12.jpg"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
