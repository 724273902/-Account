//
//  Requestmanager.m
//  易教
//
//  Created by john wall on 2018/6/21.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "Requestmanager.h"
#import "ZxResopnse.h"

@implementation Requestmanager


-(void)post:(NSString *)urlString parameter:(id)parameter completeion:(void (^)(ZxResopnse *))completion{
    [self request:@"POST" url:urlString parameters:parameter completion:completion];
    
    
}

-(void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(ZxResopnse *))completion{
    [self request:@"GET" url:urlString parameters:parameters completion:completion];
    
}

-(void)request:(NSString *)method url:(NSString *)urlString parameters:(id)parameters completion:(void (^)(ZxResopnse *response))completion{
    
    if (self.isLocal) {
        [self requestLocal:urlString completion:completion];
        return;
    }
    if (self.reachabilityManager.networkReachabilityStatus ==AFNetworkReachabilityStatusNotReachable) {
        ZxResopnse *response =[ZxResopnse new];
        response.error =[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:nil];
        response.errorMsg =@"网络无法连接";
        completion(response);
        return;
    }

    void(^success)(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) =^(NSURLSessionDataTask *_Nonnull task, id  _Nullable responseObject){
        
          [self wrapperTask:task responseObject:responseObject error:nil completion:completion];
    };
    
    void(^failure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self wrapperTask:task responseObject:nil error:error completion:completion];
    };
    
    
    
    if ([method isEqualToString:@"GET"]) {
        
        [self GET:urlString parameters:parameters progress:nil success:success failure:failure];
        
    }
    if ([method isEqualToString:@"POST"]) {
        
        [self POST:urlString parameters:parameters progress:nil success:success failure:failure];
    }
}


- (void)requestLocal:(NSString *)urlString completion:(void (^)(ZxResopnse *response))completion{
  
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURL *fileurl =[[NSBundle mainBundle]URLForResource:[urlString lastPathComponent] withExtension:@"json"];
        
        NSData *jsonData =[NSData dataWithContentsOfURL:fileurl];
        
        id responseObj =[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
       [self wrapperTask:nil responseObject:responseObj error:nil completion:completion];
    });
   
}
    
    
    
    
    
    
    
- (void)wrapperTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject error:(NSError *)error completion:(void (^)( ZxResopnse *response))completion{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        ZxResopnse *response =[self convertTask:task responseObject:responseObject error:error];
        [self LogResponse:task.currentRequest.URL.absoluteString response:response];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            !completion ?:completion(response);
        });
    });
    
    
    
    
}


-(ZxResopnse *)convertTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject error:(NSError *)error{
    
    ZxResopnse *response =[ZxResopnse new];
    if (responseObject) {
        response.responseobject= responseObject;
    }
    if (error) {
        response.error =error;
        response.statusCode =error.code;
    }
    
    if ([task.response isKindOfClass:[NSHTTPURLResponse class]] ) {
        
        NSHTTPURLResponse *httpUrlResponse =(NSHTTPURLResponse *)task.response;
        response.headers =httpUrlResponse.allHeaderFields.mutableCopy;
    }
    
    if (self.responseFormat) {
        response =self.responseFormat(response);
    }
        return response;
}

#pragma mark - 打印返回日志
- (void)LogResponse:(NSString *)urlString response:(ZxResopnse *)response
{
    NSLog(@"[%@]---%@", urlString, response);
    
}

-(void)upload:(NSString *)stringUrl parameter:(id)parameters formatDataBlock:(void(^)(id<AFMultipartFormData> formData))formDataBlock progress:(void (^)(NSProgress *))progress completion:(void (^)(ZxResopnse *))completion{
    
    
    [self POST:stringUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       !formDataBlock ?: formDataBlock(formData);
       
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            !progress ?: progress(uploadProgress);
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self wrapperTask:task responseObject:responseObject error:nil completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self wrapperTask:task responseObject:nil error:error completion:completion];
    }];
    
    
}


-(void)configSetting{
    self.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", @"text/plain", @"application/xml", @"text/xml", @"*/*", nil];
    [self.reachabilityManager startMonitoring];
    
   
    self.responseFormat = ^ZxResopnse *(ZxResopnse *response) {
        return response;
    };
    
}


- (void)setResponseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer
{
    [super setResponseSerializer:responseSerializer];
    
    if ([responseSerializer isKindOfClass:[AFJSONResponseSerializer class]]) {
        AFJSONResponseSerializer *JSONserializer = (AFJSONResponseSerializer *)responseSerializer;
        JSONserializer.removesKeysWithNullValues = YES;
        JSONserializer.readingOptions = NSJSONReadingMutableContainers;
        
    }
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self configSetting];
    }
    return self;
}
static Requestmanager *_instance =nil;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}






@end
