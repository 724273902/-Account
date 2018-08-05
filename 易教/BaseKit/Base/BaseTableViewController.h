//
//  BaseTableViewController.h
//  易教
//
//  Created by john wall on 2018/6/8.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

- (instancetype)initWithTitle:(NSString *)title;
- (void)loadMoreSub:(BOOL)isMore;
// 结束刷新, 子类请求报文完毕调用
- (void)endHeaderFooterRefreshing;
@end

