//
//  WYNetwork.m
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "WYNetworkManager.h"

@implementation WYNetworkManager

+ (instancetype)sharedManager
{
    static WYNetworkManager * instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        NSURL * url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        instance = [[self alloc]initWithURL:url];
    });
    return instance;
}
@end
