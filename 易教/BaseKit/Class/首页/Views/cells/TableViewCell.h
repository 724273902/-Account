//
//  TableViewCell.h
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;

@end
