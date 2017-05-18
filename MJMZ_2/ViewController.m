//
//  ViewController.m
//  MJMZ_2
//
//  Created by Liu Runxiong on 17/5/16.
//  Copyright © 2017年 Liu Runxiong. All rights reserved.
//

#import "ViewController.h"
#import "BaseUITableViewCell.h"
#import "BannerTableCell.h"
#import "HotDesignTableCell.h"
#import "RecomTableCell.h"
#import "WaterLayoutViewController.h"

static NSString *BANNER_IDENTIFIER = @"banner_identifier";
static NSString *HOT_DESIGN_IDENTIFIER = @"hot_design_identifier";
static NSString *Recom_Goods_IDENTIFIER = @"recom_goods_identifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
    NSMutableDictionary *_cellDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cellDic = [[NSMutableDictionary alloc] init];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_mTableView registerNib:[UINib nibWithNibName:@"BannerTableCell" bundle:nil] forCellReuseIdentifier:BANNER_IDENTIFIER];
    [_mTableView registerNib:[UINib nibWithNibName:@"HotDesignTableCell" bundle:nil] forCellReuseIdentifier:HOT_DESIGN_IDENTIFIER];
    [_mTableView registerNib:[UINib nibWithNibName:@"RecomTableCell" bundle:nil] forCellReuseIdentifier:Recom_Goods_IDENTIFIER];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2 + 15;//2为头部的三个section,15为下面的单个cell
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if(indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:BANNER_IDENTIFIER forIndexPath:indexPath];
        if(![_cellDic objectForKey:BANNER_IDENTIFIER]) {
            [_cellDic setObject:cell forKey:BANNER_IDENTIFIER];
        }
    }else if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:HOT_DESIGN_IDENTIFIER forIndexPath:indexPath];
        if(![_cellDic objectForKey:HOT_DESIGN_IDENTIFIER]) {
            [_cellDic setObject:cell forKey:HOT_DESIGN_IDENTIFIER];
        }
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:Recom_Goods_IDENTIFIER forIndexPath:indexPath];
        if(![_cellDic objectForKey:Recom_Goods_IDENTIFIER]) {
            [_cellDic setObject:cell forKey:Recom_Goods_IDENTIFIER];
        }
        RecomTableCell *recomCell = (RecomTableCell*)cell;
        if((indexPath.row -2) % 3 == 0) {
            recomCell.mSubLabel.text = @"face you";
            recomCell.mTitle.text = @"越过高山湖海，遇见梦,风略略吹过";
        }else {
            recomCell.mSubLabel.text = @"talent is nothing";
            recomCell.mTitle.text = @"三十年荣辱，一朝尽丧";
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 1;
    NSString *str;
    if(indexPath.row == 0) {
        str = BANNER_IDENTIFIER;
    }else if (indexPath.row == 1) {
        str = HOT_DESIGN_IDENTIFIER;
    }else {
        str = Recom_Goods_IDENTIFIER;
    }
    BaseUITableViewCell *cell = [_cellDic objectForKey:str];
    if(cell != nil) {
        height = cell.heightCell;
    }
    return height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row > 1) {
        WaterLayoutViewController *vc = [[WaterLayoutViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


@end
