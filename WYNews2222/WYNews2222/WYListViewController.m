//
//  WYListViewController.m
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "WYListViewController.h"

NSString * cellId = @"cellId";


@interface WYListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@end

@implementation WYListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUIup];
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
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    // 4. 设置代理和数据源
    tv.delegate = self;
    tv.dataSource = self;
    
    // 5. 记录
    _tableView = tv;
}

#pragma mark  --------- 实现代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}
@end

















