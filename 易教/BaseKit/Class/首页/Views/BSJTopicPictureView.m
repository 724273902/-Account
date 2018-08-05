//
//  BSJTopicPictureView.m
//  易教
//
//  Created by john wall on 2018/6/26.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "BSJTopicPictureView.h"
#import "ZXViewModel.h"
#import "UIView+GestureCallback.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImageDownloader.h>
#import "UIImageView+FitNet.h"
@interface BSJTopicPictureView()
@property (weak, nonatomic) UIImageView *pictureImageView;

/** <#digest#> */


/** <#digest#> */
@property (weak, nonatomic) UIImageView *gifImageView;

/** <#digest#> */
@property (weak, nonatomic) UIButton *seeBigPictureButton;
@end
@implementation BSJTopicPictureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setNeedsDisplay];
}
-(void)setupUIOnce{
    
   
        self.pictureImageView.contentMode =UIViewContentModeScaleToFill;
        self.clipsToBounds=YES;
         self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
 
}
-(void)drawRect:(CGRect)rect{
    
    UIImage *logo = [UIImage imageNamed:@"imageBackground"];
    
    [logo drawAtPoint:CGPointMake((rect.size.width - logo.size.width) * 0.5, 5)];
}

-(void)setTopicViewModel:(ZXViewModel *)topicViewModel{
    _topicViewModel =topicViewModel;
    self.gifImageView.hidden = !topicViewModel.topicItem.isGif;
    self.seeBigPictureButton.hidden =!topicViewModel.isBigPicture;
    
 
    NSLog(@"%@",self.topicViewModel.topicItem.largePicture);
    [self.pictureImageView sd_setImageWithURL:topicViewModel.topicItem.largePicture];
    /*
    [self.pictureImageView  lmj_setImageWithURL:topicViewModel.topicItem.largePicture thumbnailImageURL:topicViewModel.topicItem.smallPicture placeholderImage:nil options:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        topicViewModel.downloadPictureProgress =(CGFloat)receivedSize/expectedSize;
        
     } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        
          // 4, 处理大图, 必须是当前的模型
        if (!image || error || !self.topicViewModel.isBigPicture || self.topicViewModel != topicViewModel) {
            
            return ;
            
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(self.topicViewModel.pictureFrame.size, NO, 0);
            CGFloat w =self.topicViewModel.pictureFrame.size.width;
            CGFloat h = w * self.topicViewModel.topicItem.height / self.topicViewModel.topicItem.width;
            [image drawInRect:CGRectMake(0, 0, w, h)];
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.pictureImageView.image= newImage;
            });
        });
        
    }];
    */
    
}
#pragma mark getter
- (UIImageView *)gifImageView
{
    if(_gifImageView == nil)
    {
        UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common-gif"]];
        [self.pictureImageView addSubview:gifImageView];
        gifImageView.frame=CGRectMake(0, 0, 10, 10);
//        [gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.offset(0);
//           make.size.mas_equalTo(CGSizeMake(10,10));
//        }];
       
        
    }
    return _gifImageView;
}

-(UIImageView*)pictureImageView{
    
    if (_pictureImageView ==nil) {
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, YPScreenW, YPScreenH)];
        [self addSubview:imageView];
        _pictureImageView =imageView;
//        [_pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        }];
        _pictureImageView.userInteractionEnabled=YES;
       
    
        [_pictureImageView addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
            

//            showPicVc.topicViewModel = weakself.topicViewModel;
            //            @property (nonatomic,retain) UIViewController *popUpViewController;
            //            @property (nonatomic,assign) CGPoint popUpOffset;               //相对于弹出位置的偏移
            //            @property (nonatomic,assign) CGSize popUpViewSize;              //弹出视图的大小
            //            @property (nonatomic,assign) DDPopUpPosition popUpPosition;     //弹出视图的位置
            //            @property (nonatomic,assign) BOOL dismissWhenTouchBackground;   //是否允许点击背景dismiss
            //            @property (nonatomic,copy) DismissCallback dismissCallback;
            
            
  /*
   BSJPictureShowViewController *showPicVc = [[BSJPictureShowViewController alloc] init];
            
//            showPicVc.popUpViewSize = kScreenSize;
//
//            [weakself.viewController showPopUpViewController:showPicVc animationType:DDPopUpAnimationTypeFade];
            */
        }];
    }
    return _pictureImageView;
}

- (UIButton *)seeBigPictureButton{
    if(_seeBigPictureButton == nil)
    {
        UIButton *btn = [[UIButton alloc] init];
        [self.pictureImageView addSubview:btn];
        _seeBigPictureButton = btn;
        
//        [btn setBackgroundImage:[UIImage imageNamed:@"see-big-picture-background"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"see-big-picture"] forState:UIControlStateNormal];
        
        [btn setTitle:@"查看大图" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.bottom.left.right.offset(0);
//            make.height.mas_equalTo(34);
//
//        }];
        btn.frame =CGRectMake(0, 0, YPScreenW, 30);
        
        btn.userInteractionEnabled = NO;
        
    }
    return _seeBigPictureButton;
}

@end
