//
//  PlayerView.h
//  易教
//
//  Created by john wall on 2018/6/27.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
@protocol playerViewDelegate<NSObject>

-(void)playerViewDidClickFullScreen:(BOOL)isFull;
@end


@interface PlayerView : UIView

@property (weak, nonatomic) IBOutlet UILabel *Timelabel;

@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (weak, nonatomic) IBOutlet UIImageView *imagheView;

@property (weak, nonatomic) IBOutlet UIButton *FullScreenicon;

@property (weak, nonatomic) IBOutlet UIButton *start;


@property (weak, nonatomic) IBOutlet UISlider *slider;

/* 播放器 */
@property (nonatomic, strong) AVPlayer *player;
// 播放器的Layer
@property (weak, nonatomic) AVPlayerLayer *playerLayer;



@property(weak,nonatomic)id<playerViewDelegate> playerViewDelegate;

@property(strong,nonatomic)AVPlayerItem *playItem;

+ (instancetype)playView;
@end
