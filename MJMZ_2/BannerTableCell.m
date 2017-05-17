//
//  BannerTableCell.m
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import "BannerTableCell.h"

@implementation BannerTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 图片配文字
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        ];
    
    self.mSDCycleBanner.imageURLStringsGroup = imagesURLStrings;
    self.mSDCycleBanner.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    self.mSDCycleBanner.delegate = self;
    self.mSDCycleBanner.titlesGroup = titles;
    self.mSDCycleBanner.pageDotColor = [UIColor greenColor];
    self.mSDCycleBanner.currentPageDotColor = [UIColor redColor];
    self.mSDCycleBanner.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    self.mSDCycleBanner.autoScroll = YES;
    self.mSDCycleBanner.autoScrollTimeInterval = 3;
    self.mSDCycleBanner.infiniteLoop = YES;
    self.mSDCycleBanner.showPageControl = YES;
    
    self.heightCell = self.frame.size.height;
    NSLog(@"%f---%f",self.heightCell,CGRectGetMaxY(self.mSDCycleBanner.frame));
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}

@end
