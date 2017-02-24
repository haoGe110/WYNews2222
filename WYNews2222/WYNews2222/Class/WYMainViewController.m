//
//  WYMainViewController.m
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    NSArray * array = @[
                       @{@"clsName":@"UIViewController",@"title":@"首页",@"imageName":@"news"},
                       @{@"clsName": @"UIViewController", @"title": @"阅读", @"imageName": @"reader"},
                       @{@"clsName": @"UIViewController", @"title": @"视频", @"imageName": @"media"},
                       @{@"clsName": @"UIViewController", @"title": @"话题", @"imageName": @"bar"},
                       @{@"clsName": @"UIViewController", @"title": @"我", @"imageName": @"me"},
                       ];
    NSMutableArray * marr = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        [marr addObject:[self childViewControllerWithDict:dict]];
    }
    
    self.viewControllers = marr.copy;
}

- (UIViewController *)childViewControllerWithDict:(NSDictionary *)dict
{
    // 1. 创建控制器
    NSString * cls = dict[@"clsName"];
    Class clsName = NSClassFromString(cls);
    UIViewController * vc = [clsName new];
    
    // 2. 设置控制器的图biao
    NSString *imageName = [NSString stringWithFormat:@"tabbar_icon_%@_normal", dict[@"imageName"]];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 高亮图片
    NSString *imageNameHL = [NSString stringWithFormat:@"tabbar_icon_%@_highlight", dict[@"imageName"]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageNameHL] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // 3. 设置控制器名称
    vc.title = dict[@"title"];

    // 4. 设置导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    return nav;
}
@end














