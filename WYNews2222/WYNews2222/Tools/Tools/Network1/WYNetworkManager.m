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
        instance = [[self alloc]initWithBaseURL:url];
        
        // 设置相应的解析格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return instance;
}

// 封装AFN的GET请求
- (void)GETRequest:(NSString *)String parmeters:(NSDictionary *)parmeters completion:(void(^)(id json,NSError *error))completion{

    [self GET:String parameters:parmeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completion(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}

// 封装网易新闻网络请求接口,供外部调用
- (void)newsListWithChannel:(NSString *)channel start:(NSInteger)start completion:(void (^)(NSArray *, NSError *))completion
{
    // 拼接url
    NSString * listUrl = [NSString stringWithFormat:@"list/%@/%zd-20.html", channel, start];
    
    [self GETRequest:listUrl parmeters:nil completion:^(id json, NSError *error) {
        
        NSArray * arrar = json[channel];
        completion(arrar,nil);
    }];
}
@end











