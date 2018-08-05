//
//  Sqlite.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sqlite : NSObject

+(instancetype)sharedManager;

@property(strong,nonatomic)FMDatabaseQueue *dbqueue;

- (void)queryArrayOfDicts:(NSString *)sql completion:(void(^)(NSMutableArray<NSMutableDictionary *> *dictArrayM))completion;

@end
