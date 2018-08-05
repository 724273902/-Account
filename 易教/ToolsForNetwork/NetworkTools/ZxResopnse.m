//
//  ZxResopnse.m
//  易教
//
//  Created by john wall on 2018/6/18.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZxResopnse.h"

@implementation ZxResopnse




-(NSString *)description{
    
    return [NSString stringWithFormat:@"状态码:%lu,\n 错误提示:%@,\n响应头:%@,\n响应体:%@",(unsigned long)self.statusCode,self.error,self.headers,self.responseobject];
}

-(void)setError:(NSError *)error{
    _error =error;
    self.statusCode=error.code;
    self.errorMsg=error.localizedDescription;

}
@end
