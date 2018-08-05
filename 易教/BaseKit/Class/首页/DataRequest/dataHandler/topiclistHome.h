//
//  topiclistHome.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface topiclistHome : NSObject
+ (void)queryTopicListFromDiskWithAreaType:(NSString *)areaType topicType:(NSString *)topicType maxTime:(NSString *)maxTime per:(NSInteger)per completion:(void(^)(NSMutableArray<NSMutableDictionary *> *dictArrayM))completion;



+ (void)cachesTopicList:(NSMutableArray<NSMutableDictionary *> *)topics areaType:(NSString *)areaType;



+ (void)clearOutTimeCashes;
@end
