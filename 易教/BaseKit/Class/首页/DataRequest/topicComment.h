//
//  topicComment.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXuser.h"

@interface topicComment : NSObject


@property (nonatomic, copy) NSString *data_id;


@property (nonatomic, copy) NSString *status;


@property (nonatomic, copy) NSString *ID;


@property (nonatomic, copy) NSString *content;


@property (nonatomic, copy) NSString *ctime;


@property (assign, nonatomic) NSInteger like_count;


@property (nonatomic, strong) NSURL *voiceUrl;


@property (assign, nonatomic) NSTimeInterval voicetime;


@property (nonatomic, copy) NSString *total_cmt_like_count;



@property (nonatomic, assign)  BsjTopicType cmt_type;



@property (nonatomic, strong) ZXuser *user;
@end
