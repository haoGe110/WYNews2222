//
//  UIImageView+WYweb_image.m
//  WYNews2222
//
//  Created by mac on 17/2/26.
//  Copyright © 2017年 macd. All rights reserved.
//

#import "UIImageView+WYweb_image.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (WYweb_image)

- (void)sdwebimageWithURLstring:(NSString *)urlstring
{
    NSURL * url = [NSURL URLWithString:urlstring];
    [self sd_setImageWithURL:url];
}
@end
