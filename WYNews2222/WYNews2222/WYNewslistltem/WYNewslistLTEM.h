//
//  WYNewslistLTEM.h
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewslistLTEM : NSObject
/**
 * 标题
 */
@property (nonatomic, copy) NSString *title;
/**
 * 新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 * 图像 URL 地址
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 * 跟帖数量
 */
@property (nonatomic, assign) NSInteger replyCount;
/**
 * 来源
 */
@property (nonatomic, copy) NSString *source;

/**
 * 多图新闻的其余图片
 */
@property (nonatomic, strong) NSArray *imgextra;
/**
 * 是否大图标记
 */
@property (nonatomic, assign) BOOL imgType;
/**
 * 是否是顶部 Cell
 */
@property (nonatomic, assign) BOOL hasHead;

/**
 * 文档代号 http://c.m.163.com/nc/article/[docid]/full.html
 */
@property (nonatomic, copy) NSString *docid;
@end
