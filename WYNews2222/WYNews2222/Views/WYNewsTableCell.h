//
//  WYNewsTableCell.h
//  WYNews2222
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 macd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *datasoureLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraIcon;
@end
