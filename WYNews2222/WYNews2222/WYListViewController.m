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

NSString * NormalCellId = @"NormalCell";
NSString * ExtraImagesCellId = @"ExtraImagesCellId";

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
    
    // 3. 注册cellId
   // [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:NormalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtraImagesCell" bundle:nil] forCellReuseIdentifier:ExtraImagesCellId];
    
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ExtraImagesCellId forIndexPath:indexPath];
    
    cell.textLabel.text = _mutableData[indexPath.row].title;
    return cell;
}


@end

















