//
//  ZXViewModel.h
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//


#import "topicComment.h"
#import <Foundation/Foundation.h>
#import <YYText.h>
#import "ZXTopic.h"
#import "ZXItemParameter.h"





@interface ZXViewModel : NSObject

@property(nonatomic,strong)ZXItemParameter *topicItem;

+(instancetype)viewModelWithTopic:(ZXItemParameter *)topic;



/**是否是大图*/
@property(assign,nonatomic)BOOL isBigPicture;

/*cell高度*/
@property(assign,nonatomic,readonly) CGFloat cellHeight;

/*中间图片的frame*/
@property(assign,nonatomic,readonly) CGRect pictureFrame;

/*下载图片的进度*/
@property(assign,nonatomic) CGFloat downloadPictureProgress;

/** 创建时间的格式化 */
@property (nonatomic, copy) NSString *creatTime;

/** 评论的布局文字 */
@property(nonatomic,strong)YYTextLayout *topCmtLayout;

/** 播放时长 00 : 00 */
@property (nonatomic, copy) NSString *playLength;

/** user的评论block */
@property(nonatomic,strong)void (^cmtComment)(ZXuser *user,topicComment *comment);




/** 赞 */
@property (nonatomic, copy) NSString *zanCount;

/** 踩 */
@property (nonatomic, copy) NSString *caiCount;

/** 重置 */
@property (nonatomic, copy) NSString *repostCount;

/** 评论 */
@property (nonatomic, copy) NSString *commentCount;
















@end
