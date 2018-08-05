//
//  ZXuser.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZXuser.h"

@implementation ZXuser

+(NSDictionary *)mj_objectClassInArray{
    
    return @{};
    
}
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id",
             };
    
}

+(NSArray *)mj_ignoredPropertyNames{
    
    
    return @[@"userSex"];
}

-(BSJUserSex )userSex{
    if ([self.sex  isEqualToString:@"m"]) {
        return BsjUserSexMale;
    }else{
        return BsjUserSexFemale;
    }
    
    
    
}
@end
