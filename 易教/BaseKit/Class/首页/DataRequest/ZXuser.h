//
//  ZXuser.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXTopic.h"
@interface ZXuser : NSObject


@property (nonatomic, copy) NSString *ID;


@property (nonatomic, copy) NSString *username;



@property (nonatomic, copy) NSString *sex;



@property (nonatomic, strong) NSURL *profile_image;


@property (assign, nonatomic) BOOL is_vip;



@property (nonatomic, copy) NSString *personal_page;


@property (assign, nonatomic) CGFloat total_cmt_like_count;


@property (assign, nonatomic, readonly) BSJUserSex userSex;
@end
