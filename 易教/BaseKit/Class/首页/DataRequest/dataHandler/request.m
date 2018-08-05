//
//  request.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "request.h"
#import "ZxResopnse.h"
#import "topiclistHome.h"
#import "ZXItemParameter.h"
#import <MJExtension/MJExtension.h>
@interface request()

/** digest */
@property (nonatomic, copy) NSString *maxtime;

/** <#digest#> */
@property (nonatomic, strong) id parameters;
@end

@implementation request



-(void)getTopicMore:(BOOL)isMore typeA:(NSString *)typeA topicType:(NSInteger)topicType completion:(void (^)(NSError *, NSInteger, NSInteger))completion{
    
    
    NSMutableDictionary *parameter =[NSMutableDictionary dictionaryWithCapacity:1];
    parameter[@"a"]=typeA;
    parameter[@"c"] =@"data";
    parameter[@"type"] =@(topicType);
    parameter[@"maxtime"]=isMore?self.maxtime :nil;
    parameter[@"per"] =@(10);
    self.parameters =parameter;
    
    
//    [topiclistHome queryTopicListFromDiskWithAreaType:typeA topicType:[NSString stringWithFormat:@"%zd",topicType] maxTime:parameter[@"maxtime"] per:10 completion:^(NSMutableArray<NSMutableDictionary *> *dictArrayM) {
//        if (self.parameters!=parameter) {
//            return ;
//        }
//        if (dictArrayM.count >0) {
//            if (!isMore) {
//                [self.topicViewModels removeAllObjects];
//            }
//
//        NSMutableArray<ZXViewModel*>  *models =[NSMutableArray array];
//
//        [[ZXItemParameter mj_objectArrayWithKeyValuesArray:dictArrayM ] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [models addObject:[ZXViewModel viewModelWithTopic:obj]];
//        }];
//        [self.topicViewModels addObjectsFromArray:models];
//        self.maxtime =self.topicViewModels.lastObject.topicItem.t;
//
//        completion(nil,99999,self.topicViewModels.count);
//
//
//
//
//    }else{
        [self GET:BSJBaiSiJieHTTPAPI parameters:parameter completion:^(ZxResopnse *response) {
            if (self.parameters != parameter) {
                return ;
            }
            
            if (response.error) {
                completion(response.error, 0, 0);
                return ;
            }
            
            if (!isMore) {
                
                [self.topicViewModels removeAllObjects];
            }
            
            if (!LMJIsEmpty(response.responseobject[@"list"])) {
                [topiclistHome cachesTopicList:response.responseobject[@"list"] areaType:typeA];
            }
            NSMutableArray<ZXViewModel *> *newTopicViewModels = [NSMutableArray array];
            
            [[ZXItemParameter mj_objectArrayWithKeyValuesArray:response.responseobject[@"list"]] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newTopicViewModels addObject:[ZXViewModel viewModelWithTopic:obj]];
            }];
            [self.topicViewModels addObjectsFromArray:newTopicViewModels];
            self.maxtime =self.topicViewModels.lastObject.topicItem.t;
            
            completion(nil,[response.responseobject[@"info"][@"count"]integerValue],self.topicViewModels.count);
            
        }];
      // }
   // }];
}

-(NSMutableArray <ZXViewModel *>*)topicViewModels{
    
    if(_topicViewModels == nil)
    {
        _topicViewModels = [NSMutableArray array];
    }
    return _topicViewModels;
}


@end
