//
//  BaseTabbarController.m
//  易教
//
//  Created by john wall on 2018/3/23.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "DiscussViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewControllers];
    self.selectedIndex=2;
}
-(void)setupAllChildViewControllers{
    MeViewController *Me =[MeViewController new];
    HomeViewController *home =[HomeViewController new];
    DiscussViewController *discuss =[DiscussViewController new];
    MessageViewController *Message =[MessageViewController new];
   
        [self setupChildController:home title:@"首页" imageName:@"home" selectedImage:@"home_hover"];
        [self setupChildController:discuss title:@"论坛" imageName:@"home" selectedImage:@"home_hover"];
        [self setupChildController:Message title:@"消息" imageName:@"home" selectedImage:@"home_hover"];
      [self setupChildController:Me title:@"我" imageName:@"home" selectedImage:@"home_hover"];
}
-(void)setupChildController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)image selectedImage:(NSString *)SeletedImage{
    controller.tabBarItem.title =title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage=[UIImage imageNamed:SeletedImage];
    
    BaseNavigationController *navi =[[BaseNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:navi];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
