//
//  Sqlite.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "Sqlite.h"

static NSString *const dbname =@"bsj_t_topics.sqlite";
static NSString *const listTableName_ = @"t_topics";
static NSString *const nweListTableName_ = @"new_t_topics";
static NSString *_dbPath = nil;
@implementation Sqlite


+(void)load{
    _dbPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:dbname] ;
    NSLog(@"%@",_dbPath);
}


    

-(FMDatabaseQueue*)dbqueue{
    if (_dbqueue == nil) {
        _dbqueue =[FMDatabaseQueue databaseQueueWithPath:_dbPath];
       
       
    }
    return _dbqueue;
}



-(void)queryArrayOfDicts:(NSString *)sql completion:(void (^)(NSMutableArray<NSMutableDictionary *> *dictArrayM))completion{
    
    NSMutableArray<NSMutableDictionary *> *dictArrayM = [NSMutableArray array];
    
    [self.dbqueue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *resultSet =[db executeQuery:nil withArgumentsInArray:@[]];
        while (resultSet.next) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            for (int i=0; i<resultSet.columnCount; i++) {
                NSString *colName =[resultSet columnNameForIndex:i];
                NSString *colvalue=[resultSet objectForColumn:colName];
                dic[colName]=colvalue;
            }
            [dictArrayM addObject:dic];
        }
        completion(dictArrayM);
    }];
    
}


-(void)creatTable{
    
    NSString *creatTabelSql =@"CREATE TABLE IF NOT EXISTS t_topics\n\(id INTEGER PRIMARY KEY AUTOINCREMENT, \n\
    topic BLOB NOT NULL, \n\
    type TEXT NOT NULL, \n\
    t INTEGER NOT NOT NULL, \n\
    time TEXT NOT NULL DEFAULT(datetime('now','localtime'))\n\
    )\n";
    
    [self.dbqueue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL  result =[db
                       executeStatements:creatTabelSql];
        if (result) {
            NSLog(@"创建表成功");
        }else {
            NSLog(@"创建表失败");
        }
    }];
    
    
    
    
    NSString *creatNewTopicTableSql = @"CREATE TABLE IF NOT EXISTS new_t_topics \n\
    (id INTEGER PRIMARY KEY AUTOINCREMENT, \n\
    topic BLOB NOT NULL, \n\
    type TEXT NOT NULL, \n\
    t INTEGER NOT NULL, \n\
    time TEXT NOT NULL  DEFAULT (datetime('now', 'localtime'))\n\
    )\n";
    
    [self.dbqueue inDatabase:^(FMDatabase *db) {
        
        BOOL result = [db executeStatements:creatNewTopicTableSql];
        
        if (result) {
            NSLog(@"创建表成功");
        }else {
            NSLog(@"创建表失败");
        }
        
    }];
    
}


-(instancetype)init{
    
    self =[super init ];
    if (self) {
        [self creatTable];
    }
    return self;
}

static id instance =nil;

+(instancetype)sharedManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance =[[self alloc]init];
        }
    });
    
    return instance;
    
}







    
    
    

@end
