//
//  ZXTopic.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//




typedef enum :NSUInteger{
    BsjTopicAll =1,
    BsjTopicPicture =10,
    BsjTopicWords =29,
    BsjTopicTypeVoice=31,
    BsjTopicTypeVideo =41
     //    1为全部，10为图片，29为段子，31为音频，41为视频
} BsjTopicType;;

typedef enum: NSUInteger{
    BsjUserSexFemale=1,
    BsjUserSexMale =0
    
}BSJUserSex;


UIKIT_EXTERN NSString *const BSJBaiSiJieHTTPAPI;
/**
 *  用户的性别, 服务器返回字段
 */
UIKIT_EXTERN NSString *const BSJUserSexFemaleStr;
UIKIT_EXTERN NSString *const BSJUserSexMaleStr;




















