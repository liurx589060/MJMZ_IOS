//
//  WaterLayoutViewController.m
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/18.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import "WaterLayoutViewController.h"
#import "XRImage.h"
#import "XRWaterfallLayout.h"
#import "XRCollectionViewCell.h"

@interface WaterLayoutViewController ()<UICollectionViewDataSource,XRWaterfallLayoutDelegate>

@end

static NSString *CELL_IDENTIFIER = @"waterCell";

@implementation WaterLayoutViewController
{
    NSMutableArray<XRImage *> *_images;
}

- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            XRImage *image = [XRImage imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.mBackBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    XRWaterfallLayout *waterfall = [XRWaterfallLayout waterFallLayoutWithColumnCount:3];
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    waterfall.delegate = self;
    
    [self.mCollectionView registerNib:[UINib nibWithNibName:@"XRCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    self.mCollectionView.collectionViewLayout = waterfall;
    self.mCollectionView.dataSource = self;
    
    [self images];
    
    
}

-(CGFloat)waterfallLayout:(XRWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    XRImage *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  _images.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XRCollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    cell.imageURL = _images[indexPath.item].imageURL;
    return cell;
}

-(void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
