//
//  WMPageViewController.m
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "WMPageViewController.h"
#import "FirstViewController.h"
#import "TwoViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
@interface WMPageViewController ()

@property(nonatomic,strong)NSArray *titleData;
@property(nonatomic,strong)UITableViewController *tableviewVC;
@end

@implementation WMPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSArray *)titleData{
    if (!_titleData) {
        _titleData =@[@"全部",@"段子",@"图片",@"视频",@"段子",@"其他"];
    }
    return _titleData;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //   [self.navigationController setNavigationBarHidden:YES animated:YES]; //设置隐藏
    [super viewWillAppear:animated];
}

-(instancetype)init{
    
    if (self =[super init]) {
        self.titleSizeNormal=15;
        self.titleSizeSelected=18;
        // self.showOnNavigationBar=YES;
        self.titleColorNormal=[UIColor blackColor];
        self.titles=@[@"1",@"2",@"3",@"4",@"5",@"6",];
        self.titleColorSelected=[UIColor redColor];
        self.menuView.backgroundColor=[UIColor whiteColor];
        self.menuViewBottomSpace=0;
        self.progressViewBottomSpace=0;
        ;
        self.progressWidth=20;
        self.menuItemWidth=20;
        self.menuViewStyle= WMMenuViewStyleLine;
        self.menuItemWidth=[UIScreen mainScreen].bounds.size.width/self.titleData.count;
        self.menuHeight=30;
    }
    return self;
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    
    return self.titleData.count;
}


-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    
    switch (index) {
        case 0:{
            FirstViewController *first =[[FirstViewController alloc]initWithTitle:@"段子"];
            first.topicType=BsjTopicAll;
            return first;
            
        }
            break;
        case 1:{
            FirstViewController *two =[[FirstViewController alloc] initWithTitle:@"音频"];
            two.topicType =BsjTopicTypeVideo;
            return two;
        }
            break;
        case 2:{
            
            FirstViewController *third =[[FirstViewController alloc] initWithTitle:@"图片"];
            third.topicType =BsjTopicPicture;
            return third;
        }
            break;
            
        case 3:{
            FirstViewController *four =[[FirstViewController alloc]  initWithTitle:@"视频"];
            four.topicType = BsjTopicTypeVideo;
            return four;
        }
        case 4:{
            FirstViewController *five =[[FirstViewController alloc] initWithTitle:@"全部"];
            five.topicType = BsjTopicWords;;
            return five;
        }
        
        default:{
            FourViewController *seven= [FourViewController new];
            
            return seven;
        }
            break;
    }
    
    
    
    //    1为全部，10为图片，29为段子，31为音频，41为视频

}




-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    
    
    return self.titleData[index];
    
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
