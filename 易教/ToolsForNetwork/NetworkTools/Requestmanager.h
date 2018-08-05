//
//  Requestmanager.h
//  易教
//
//  Created by john wall on 2018/6/21.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ZxResopnse.h"
typedef  void  (^CallBlock)(NSString * string);
typedef ZxResopnse *(^formatResponse)(ZxResopnse *response);
@interface Requestmanager : AFHTTPSessionManager
+(instancetype)sharedManager;
@property (assign, nonatomic) BOOL isLocal;

//预处理返回的数据
@property (copy, nonatomic) formatResponse responseFormat;

-(void)post:(NSString *)urlString parameter:(id)parameter completeion:(void(^)(ZxResopnse *response))completion;


- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(ZxResopnse *response))completion;




-(void)upload:(NSString *)stringUrl parameter:(id)parameters formatDataBlock:(void (^)(id<AFMultipartFormData> fromData))fromDataBlock progress:(void(^)(NSProgress *progress))progress completion:(void(^)(ZxResopnse *response))completion;









@end
