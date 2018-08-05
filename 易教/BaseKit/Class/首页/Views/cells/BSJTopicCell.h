//
//  BSJTopicCell.h
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/5/19.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXViewModel.h"

@interface BSJTopicCell : UITableViewCell


+ (instancetype)topicCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ZXViewModel *topicViewModel;



@end
