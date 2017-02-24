//
//  AppDelegate.m
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    sleep(1);
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class  cls = NSClassFromString(@"WYListViewController");
    UIViewController * vc = [cls new];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    return YES;
}


@end
