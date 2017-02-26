//
//  WYListViewController.m
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "WYListViewController.h"
#import "WYNewslistLTEM.h"
#import "WYNewsTableCell.h"

#import <UIImageView+WebCache.h>


NSString * NormalCellId = @"NormalCell";
NSString * ExtraImagesCellId = @"ExtraImagesCellId";
NSString * bigImagecellId = @"bigImagecellId";
NSString * headImageCellId = @"headImageCellId";

@interface WYListViewController ()<UITableViewDataSource,UITableViewDelegate>

//  记录表格
@property(nonatomic,strong)UITableView * tableView;

//  记录模型数据
@property(nonatomic,strong)NSMutableArray<WYNewslistLTEM *> * mutableData;
@end

@implementation WYListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUIup];
    [self loadData];
}

- (void)loadData
{
    [[WYNetworkManager sharedManager]newsListWithChannel:@"T1348649079062" start:0 completion:^(NSArray *array, NSError *error) {
        
        NSLog(@"%@",array);
        
        // yy_model字典转模型
        NSArray * array1 = [NSArray yy_modelArrayWithClass:[WYNewslistLTEM class] json:array];
        
        // 将模型添加到数组
        _mutableData = [NSMutableArray arrayWithArray:array1];
        
        // 刷新表格
        [_tableView reloadData];
        
    }];
}
#pragma mark -------- 搭建界面
- (void)setUIup
{
    // 1. 创建一个tableView
    UITableView * tv = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tv];
    
    // 2. 设置约束
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 设置自动行高
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    
    // 3. 注册cellId
    [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:NormalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtraImagesCell" bundle:nil] forCellReuseIdentifier:ExtraImagesCellId];
    [tv registerNib:[UINib nibWithNibName:@"bigImage" bundle:nil] forCellReuseIdentifier:bigImagecellId];
    [tv registerNib:[UINib nibWithNibName:@"headImageCell" bundle:nil] forCellReuseIdentifier:headImageCellId];
    
    // 4. 设置代理和数据源
    tv.delegate = self;
    tv.dataSource = self;
    
    // 5. 记录
    _tableView = tv;
}

#pragma mark  --------- 实现代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mutableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYNewslistLTEM *model = _mutableData[indexPath.row];

    NSString * cellId;
    if (model.hasHead) {
        cellId = headImageCellId;
    } else if (model.imgType) {
        cellId = bigImagecellId;
    } else if (model.imgextra.count > 0) {
        cellId = ExtraImagesCellId;
    } else {
        cellId = NormalCellId;
    }

    WYNewsTableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 2. 设置数据
    cell.titleLabel.text = model.title;
    cell.datasoureLabel.text = model.source;
    cell.replyLabel.text = @(model.replyCount).description;
    
    // 设置图片
    NSURL *imageURL = [NSURL URLWithString:model.imgsrc];
    
    [cell.iconImage sd_setImageWithURL:imageURL];
    
    // 设置多图 － 如果没有不会进入循环
    NSInteger idx = 0;
    for (NSDictionary *dict in model.imgextra) {
        
        // 1. 获取url字符串
        NSURL *url = [NSURL URLWithString:dict[@"imgsrc"]];
        
        // 2. 设置图像
        UIImageView *iv = cell.extraIcon[idx++];
        
        [iv sd_setImageWithURL:url];
    }

    return cell;
}


@end

















