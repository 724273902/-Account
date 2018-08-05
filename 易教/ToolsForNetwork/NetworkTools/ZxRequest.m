//
//  ZxRequest.m
//  易教
//
//  Created by john wall on 2018/6/18.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZxRequest.h"
#import "ZxResopnse.h"
#import "Requestmanager.h"
@implementation ZxRequest
- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)( ZxResopnse *response))completion
{
    ZXWeakSelf(self);

    
    [[Requestmanager sharedManager ] GET:URLString parameters:parameters completion:^(ZxResopnse *response) {
        if (!weakself) {
            return ;
        }
        !completion ?:completion(response);
    }];
  
        
        
    
}

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)( ZxResopnse *response))completion
{
    ZXWeakSelf(self);
    
    
    [[Requestmanager sharedManager ]post:URLString parameter:parameters completeion:^(ZxResopnse *response) {
        if (!weakself) {
            return ;
        }
        !completion ?:completion(response);
    }];
            
}
@end
