//
//  AVVideoViewController.m
//  易教
//
//  Created by john wall on 2018/6/27.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "AVVideoViewController.h"
#import "PlayerView.h"
@interface AVVideoViewController ()<playerViewDelegate>

@property(nonatomic,weak)PlayerView *playerView;
@end

@implementation AVVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    [UIApplication sharedApplication].statusBarHidden=YES;
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden =YES;
}

-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
 //   self.playerView.frame =self.view.frame;
}
-(void)setVideoUrl:(NSString *)videoUrl{
    
    _videoUrl = videoUrl;
    
    NSURL *url = [NSURL URLWithString:videoUrl];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.playerView.playItem=item;
}
- (PlayerView *)playerView
{
    if(_playerView == nil)
    {
        PlayerView *play =[PlayerView playView];
        play.playerViewDelegate=self;
       
        [self.view addSubview:play];
        _playerView =play;
        
    }
    return _playerView;
}
#pragma mark - NJPlayerViewDelegate
- (void)playerViewDidClickFullScreen:(BOOL)isFull
{
    [self.playerView removeFromSuperview];
    [self.playerView.player pause];
    
    self.playerView=nil;
    [self dismissClick];
}
- (void)dismissClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
