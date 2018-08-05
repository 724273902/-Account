//
//  AVPlayerItemController.m
//  易教
//
//  Created by john wall on 2018/6/27.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "AVPlayerItemController.h"



@implementation AVPlayerItemController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.allowsPictureInPicturePlayback=YES;
    self.showsPlaybackControls=YES;
  
    self.delegate =self;
    [self.player play];
}

-(void)setVideoUrl:(NSString *)videoUrl{
    
    _videoUrl =videoUrl;
    
    NSURL *remoteUrl =[NSURL URLWithString:_videoUrl];
    AVPlayer *player =[AVPlayer playerWithURL:remoteUrl];
    self.player =player;
    
}
-(BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController{
    
    [self dismissViewControllerAnimated:NO completion:^{
    
    }];
    return NO;
    
}









@end
