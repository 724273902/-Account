//
//  UITableView+ZXtableview.m
//  易教
//
//  Created by john wall on 2018/3/26.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "UITableView+ZXtableview.h"

@implementation UITableView (ZXtableview)
+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    //将系统的Separator左边不留间隙
    tableView.separatorInset = UIEdgeInsetsZero;
    return tableView;
}
@end
