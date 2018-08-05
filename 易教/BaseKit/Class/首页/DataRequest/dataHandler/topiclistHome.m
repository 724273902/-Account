//
//  topiclistHome.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "topiclistHome.h"

static NSString *const listTableName_ = @"t_topics";
static NSString *const nweListTableName_ = @"new_t_topics";

@implementation topiclistHome
+(void)cachesTopicList:(NSMutableArray<NSMutableDictionary *> *)topics areaType:(NSString *)areaType{
    
    
    if (topics ==nil ||[topics isKindOfClass:[NSNull class]] ) {
        return;
    };
    if ([topics respondsToSelector:@selector(length)] &&[(NSData *)topics length] ==0) {
        return;
    }
    
    NSString *tableName = nil;
    if ([areaType isEqualToString:@"list"]) {
        tableName = listTableName_;
    }else if ([areaType isEqualToString:@"newlist"]) {
         tableName = nweListTableName_;
}


}
@end
