//
//  ZxRequest.h
//  易教
//
//  Created by john wall on 2018/6/18.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZxResopnse;
@interface ZxRequest : NSObject



- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZxResopnse *response))completion;


- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(ZxResopnse *response))completion;
@end
