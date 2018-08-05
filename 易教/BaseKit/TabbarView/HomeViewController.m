//
//  HomeViewController.m
//  易教
//
//  Created by john wall on 2018/3/23.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "HomeViewController.h"
#import "WMPageViewController.h"
#import "TeacherViewController.h"
@interface HomeViewController ()
@property(nonatomic,strong)WMPageViewController *wmPagecontroller;
@property(nonatomic,strong)TeacherViewController *teahcer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setUPSegmentControl];

    self.teahcer=[TeacherViewController new];
    [self addChildViewController:self.teahcer];
    
    self.wmPagecontroller =[WMPageViewController new];
    [self addChildViewController:self.wmPagecontroller];
    
    [self.view addSubview:self.childViewControllers[1].view];
   // [self.view addSsubview:self.teahcer.view];
    
    
}
-(void)setUPSegmentControl{
    
    NSArray *segArray = [[NSArray alloc] initWithObjects:@"学校",@"老师" ,nil];
    
    UISegmentedControl *segmentedC = [[UISegmentedControl alloc] initWithItems:segArray];
    segmentedC.frame = CGRectMake(0, 0, 100, 25);
    
    segmentedC.backgroundColor = [UIColor whiteColor];  //

    segmentedC.layer.masksToBounds = YES;
    
    segmentedC.layer.cornerRadius = 2;
    
    segmentedC.layer.borderWidth = 1;
    
    segmentedC.layer.borderColor = [UIColor blueColor].CGColor;
    
    [segmentedC addTarget:self action:@selector(SegmentChange:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=segmentedC;
   // [self.navigationController.navigationBar.topItem setTitleView:segmentedC];
   
}
-(void)SegmentChange:(UISegmentedControl*)sgc{
    switch (sgc.selectedSegmentIndex) {
        case 0:
//            if (self.childViewControllers[0].view == self.teahcer.view) {
//                return;
//            }else{
//
//            }
                [self replaceFromOldController:self.teahcer toNewController:self.wmPagecontroller];
//     //   {
//            [self transitionFromViewController:self.childViewControllers[1] toViewController:self.childViewControllers[0] duration:0 options:0 animations:0 completion:^(BOOL finished) {
//                /*
//                 在项目中使用addChildViewController添加,但是发现当点击切换时有时如果点击过于频繁或者速度过快,就会出现页面加载不出来的情况.使用下面的方式便能完美解决.
//                 */
//                /**********************************/
//                if (finished) {
//                    [self.view addSubview:[self.childViewControllers[0] view]];
//                } else {
//                    [self.view addSubview:[self.childViewControllers[1] view]];
//                }
//                /**********************************/
//            }];
//        }
            break;
        case 1:
//            if (self.childViewControllers[1].view == self.wmPagecontroller.view) {
//                return;
//            }else{
//                 }
            [self replaceFromOldController:self.wmPagecontroller toNewController:self.teahcer];
//        { [self transitionFromViewController:self.childViewControllers[0] toViewController:self.childViewControllers[1] duration:0 options:0 animations:0 completion:^(BOOL finished) {
//                if (finished) {
//                    [self.view addSubview:[self.childViewControllers[1] view]];
//                } else {
//                    [self.view addSubview:[self.childViewControllers[0] view]];
//                }
//        }];}
            break;
        default:
            break;
    }
    
    
}
-(void)replaceFromOldController:(UIViewController *)oldVc toNewController:(UIViewController *)newVc{
    
    [self transitionFromViewController:oldVc toViewController:newVc duration:.1f options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
        //    [newVc didMoveToParentViewController:self];
        //    [oldVc removeFromParentViewController];
            
            //  self.currentViewController=newVc;
        }else{
           
        }
    }];
    
    
}





@end
