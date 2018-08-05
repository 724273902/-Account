//
//  ZxResopnse.h
//  易教
//
//  Created by john wall on 2018/6/18.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxResopnse : NSObject

@property(nonatomic,strong) NSError *error;
@property(nonatomic,copy)   NSString *errorMsg;
@property(nonatomic,assign) NSUInteger statusCode;
@property(nonatomic,copy)   NSMutableDictionary *headers;
@property(nonatomic,strong) id responseobject;

@end
