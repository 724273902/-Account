//
//  MessageViewController.h
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "BaseViewController.h"

@interface MessageViewController : BaseViewController
@property(nonatomic,strong)UIScrollView *scrollV;
@property(nonatomic,strong)UIPageControl *pageCtr;
@property(nonatomic,strong)NSTimer *timer;
@end
