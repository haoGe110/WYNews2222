//
//  WYNetwork.h
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WYNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)newsListWithChannel:(NSString *)channel start:(NSInteger)start completion:(void (^)(NSArray *array ,NSError * error))completion;

@end
