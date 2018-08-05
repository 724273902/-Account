//
//  ZXViewModel.m
//  易教
//
//  Created by john wall on 2018/6/25.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "ZXViewModel.h"
#import "NSDate+YYAdd.h"



/** 屏幕的距离*/
const CGFloat BSJCellScreenMargin = 5;
/**四周的间距*/
const CGFloat BSJCellEdageMargin = 10;
/*头像的高度*/
const CGFloat BSJCellHeaderSize = 50;
/** 底部条的高度*/
const CGFloat BSJCellBottomBarHeight = 35;
/*最大的图片的高度*/
const CGFloat BSJCellContentImageMaxHeight = 1000.0;

/*超出最大高度后的高度*/
#define BSJCellContentImageBreakHeight ( YPScreenH - BSJCellScreenMargin * 2 - BSJCellEdageMargin * 2);

@implementation ZXViewModel

+(instancetype)viewModelWithTopic:(ZXItemParameter *)topic{
    
    ZXViewModel *viewModel =[[self alloc]init];
    viewModel.topicItem =topic;
    
    if (topic.topCmts.firstObject) {
        NSLog(@"%@",topic.topCmts.firstObject.content);
    }
    return viewModel;
}
    



-(void)setTopicItem:(ZXItemParameter *)topicItem{
    
  
   _topicItem =topicItem;
   
  
    [self handleUIData];
    
    const CGFloat contentTextWidth = YPScreenW -BSJCellScreenMargin *2 -BSJCellEdageMargin *2;
    
    CGSize asize =CGSizeMake(contentTextWidth, INFINITY);
    CGFloat contentTextHeight =[topicItem.text boundingRectWithSize:asize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:adaptedFontSize(16)} context:nil].size.height;
    
    _cellHeight +=(10+10+BSJCellHeaderSize +10) +contentTextHeight +10+BSJCellBottomBarHeight;
    
    
    if (topicItem.type != BsjTopicWords) {
        CGFloat pictureheight =contentTextWidth *topicItem.height /topicItem.width;
        if (pictureheight >BSJCellContentImageMaxHeight) {
            pictureheight =BSJCellContentImageBreakHeight;
            self.isBigPicture=YES;

      
    }
        _pictureFrame=CGRectMake(BSJCellScreenMargin +BSJCellEdageMargin, 10+10 +BSJCellHeaderSize+10+contentTextHeight+10, contentTextWidth, pictureheight);
        
        
        _cellHeight +=pictureheight +10;
    
      
     }
    if (self.topicItem.topCmts.count) {
        
        [self.topicItem.topCmts addObject:self.topicItem.topCmts.firstObject];
        
    }
    _cellHeight += self.topCmtLayout.textBoundingSize.height +20+10;
    
    
    
}


-(void)handleUIData{
    self.zanCount =[self countformat:self.topicItem.ding];
    self.caiCount=[self countformat:self.topicItem.cai];
    self.repostCount=[self countformat:self.topicItem.repost];
    self.commentCount=[self countformat:self.topicItem.comment];
    self.playLength =[NSString stringWithFormat:@"%ld:%ld",(self.topicItem.playfcount)/1000/60,(self.topicItem.playfcount/1000)%60];
    
    
    self.creatTime =[self formatCreatTime];
    
}
-(NSString *)countformat:(NSInteger)count{
    
    if (count >10000) {
        return [NSString stringWithFormat:@"%.1ld万",count/10000];
        
    }
    return  [NSString stringWithFormat:@"%ld",count];
}
-(NSString *)formatCreatTime{
    
 NSDate *creatDate=   [NSDate dateWithString:self.topicItem.create_time format:@"yyyy-MM-dd HH:mm:ss"];
   

    NSCalendarUnit  unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    
    NSDateComponents *components =[[NSCalendar currentCalendar]components:unit fromDate:creatDate toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    NSDateFormatter *formatter =[NSDateFormatter new];
    
    if(creatDate.isToday && fabs([creatDate timeIntervalSinceNow]) < 60.0){
        return @"刚刚";
    }else if (creatDate.isToday && abs([creatDate timeIntervalSinceNow] <3600)){
         return [NSString stringWithFormat:@"%zd分钟前", components.minute];
    }else if ([creatDate isToday])
    {
        return [NSString stringWithFormat:@"%zd小时前", components.hour];
        
    }else if ([creatDate isYesterday])
    {
        formatter.dateFormat=@"昨天 HH:mm:ss";
        return [formatter stringFromDate:creatDate];
    }else if (components.year == [[NSDate date] year])
    {
        formatter.dateFormat = @"MM-dd HH:mm:ss";
        
        return [formatter stringFromDate:creatDate];
    }else
    {
        return self.topicItem.create_time;
    }
}
@end
