//
//  ZXItemParameter.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZXItemParameter.h"

@implementation ZXItemParameter
/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+ (NSDictionary *)mj_objectClassInArray
{
    
    return @{@"topCmts" : [topicComment class]};
}

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID" : @"id",
             
             @"smallPicture" : @"image0",
             
             @"middlePicture" : @"image2",
             
             @"largePicture" : @"image1",
             
             @"voiceUrl" : @"voiceuri",
             
             @"videoUrl" : @"videouri",
             
             @"gif" : @"is_gif",
             
             @"topCmts" : @"top_cmt",
             
             };
}

+ (NSArray *)mj_ignoredPropertyNames
{
    return @[];
}
@end
