//
//  PlayerView.m
//  易教
//
//  Created by john wall on 2018/6/27.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "PlayerView.h"
@interface PlayerView()




//记录当前是否显示了工具栏
@property (assign, nonatomic) BOOL isShowToolView;

/* 定时器, 用作更新播放进度 */
@property (nonatomic, strong) NSTimer *progressTimer;
@end

@implementation PlayerView

#pragma mark
+ (instancetype)playView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:nil options:nil] firstObject];
}


-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor =[UIColor blackColor];
    self.player = [[AVPlayer alloc] init];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [self.imagheView.layer addSublayer:self.playerLayer];
    
    self.playerLayer.frame = CGRectMake(0, 0, YPScreenW, YPScreenH-40);
    self.toolView.alpha = 1;
    self.isShowToolView = NO;
    
    
    [self.start addTarget:self action:@selector(playOrPause) forControlEvents:UIControlEventTouchUpInside];
    [self.FullScreenicon addTarget:self action:@selector(switchFullScreen) forControlEvents:UIControlEventAllEvents];
    
    
    [self.slider addTarget:self action:@selector(sliderValueChange ) forControlEvents:UIControlEventTouchUpInside];
    [self.slider addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self.slider addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    
    [self.slider setThumbImage:[UIImage imageNamed:@"NJPlayer.bundle/thumbImage"] forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"NJPlayer.bundle/MaximumTrackImage"] forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"NJPlayer.bundle/MinimumTrackImage"] forState:UIControlStateNormal];
    
    [self removeProgressTimer];
    [self addProgressTimer];
    
    self.start.selected=YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
   
    
    
}


-(void)setPlayItem:(AVPlayerItem *)playItem{
    _playItem =playItem;
    [self.player replaceCurrentItemWithPlayerItem:playItem];
    [self.player play];
    
}

-(void)playOrPause{
    _start.selected =!_start.selected;
    
    if (_start.selected) {
        [self.player play];
        
        [self addProgressTimer];
    } else {
        [self.player pause];
        
        [self removeProgressTimer];
    }
    
    
    
}
#pragma mark
-(void)valueChange{
    
    NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentItem.duration) * self.slider.value;
    
    NSTimeInterval duration = CMTimeGetSeconds(self.player.currentItem.duration);
    self.Timelabel.text = [self stringWithCurrentTime:currentTime duration:duration];
    NSLog(@"%@",self.Timelabel.text);
}

-(void)sliderValueChange {
    [self addProgressTimer];
    NSTimeInterval currentTime= CMTimeGetSeconds(self.player.currentItem.duration)*self.slider.value;
    [self.player seekToTime:CMTimeMakeWithSeconds(currentTime, NSEC_PER_SEC) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];

}

-(void)switchFullScreen {

    self.FullScreenicon.selected = !self.FullScreenicon.selected;
    if ([self.playerViewDelegate respondsToSelector:@selector(playerViewDidClickFullScreen:)]) {
        [self.playerViewDelegate playerViewDidClickFullScreen:self.FullScreenicon.selected];
    }
    
}
-(void)touchDown {
    [self removeProgressTimer];
}
- (IBAction)taps:(UITapGestureRecognizer *)tap{
    
    
    [UIView animateWithDuration:.5f animations:^{
        if (self.isShowToolView) {
            self.toolView.alpha =0;
            self.isShowToolView=NO;
        }else{
            self.toolView.alpha = 1;
            self.isShowToolView = YES;
        }
    }];
    
    
}




-(void)removeProgressTimer{
    
    [self.progressTimer invalidate];
    self.progressTimer = nil;
}

-(void)addProgressTimer{
    
    self.progressTimer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
 
        [[NSRunLoop mainRunLoop]addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
    
    
}
-(void)updateProgressInfo{
    NSTimeInterval duration =CMTimeGetSeconds(self.player.currentItem.duration);
    NSTimeInterval currentTime =CMTimeGetSeconds(self.player.currentTime);
    
    NSInteger dMin = duration / 60;
    NSInteger dSec = (NSInteger)duration % 60;
                                                   
    NSInteger cMin = currentTime / 60;
    NSInteger cSec = (NSInteger)currentTime % 60;
    
    NSString *durationString = [NSString stringWithFormat:@"%.2ld:%.2ld", (long)dMin, dSec];
      NSString *currentString = [NSString stringWithFormat:@"%02ld:%02ld", cMin, cSec];
  self.Timelabel.text =  [NSString stringWithFormat:@"%@/%@", currentString, durationString];
    
    self.slider.value =CMTimeGetSeconds(self.player.currentTime)/CMTimeGetSeconds(self.player.currentItem.duration);
}

- (NSString *)stringWithCurrentTime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration
{
    NSInteger dMin = duration / 60;
    NSInteger dSec = (NSInteger)duration % 60;
    
    NSInteger cMin = currentTime / 60;
    NSInteger cSec = (NSInteger)currentTime % 60;
    
    NSString *durationString = [NSString stringWithFormat:@"%02ld:%02ld", dMin, dSec];
    NSString *currentString = [NSString stringWithFormat:@"%02ld:%02ld", cMin, cSec];
    
    return [NSString stringWithFormat:@"%@/%@", currentString, durationString];
}





@end
