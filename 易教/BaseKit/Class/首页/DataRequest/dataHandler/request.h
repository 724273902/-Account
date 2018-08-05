//
//  request.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZxRequest.h"
#import "ZXViewModel.h"
@interface request : ZxRequest


@property(nonatomic,strong)NSMutableArray<ZXViewModel *> *topicViewModels;
/**
 加载帖子
 
 @param isMore 是上拉加载更多吗
 @param typeA 参数值为list，如果想要获取“新帖”板块的帖子，则传入"newlist"即可
 @param topicType 1为全部，10为图片，29为段子，31为音频，41为视频
 */
-(void)getTopicMore:(BOOL)isMore typeA:(NSString *)typeA topicType:(NSInteger )topicType  completion:(void(^)(NSError *errror, NSInteger totalCount,NSInteger curretCount))completion;
@end
