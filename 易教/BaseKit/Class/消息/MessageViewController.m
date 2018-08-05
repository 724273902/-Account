//
//  MessageViewController.m
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "MessageViewController.h"
#import "UIBarButtonItem+ZXBarButtonItem.h"
#import "MessageDetailController.h"
@interface MessageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@end


#define ScrollViewImageCount 5
#define  imagY 0
#define  imagW self.view.frame.size.width
#define  imagH self.view.frame.size.height *0.3



@implementation MessageViewController{
    NSInteger  page;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    page =0;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"other" style:(UIBarButtonItemStyleDone) target:self action:@selector(movefrontController)];
    self.navigationItem.leftBarButtonItem=  [UIBarButtonItem initWithTitle:@"nothing" titleColor:[UIColor blueColor] target:self action:@selector(moveNextController)];

    // 初始化
    NSDictionary *dict0 = [[NSDictionary alloc] initWithObjectsAndKeys:@"张绍锋", @"name", @"男", @"sex", nil];
    NSDictionary *dict001=   [[NSDictionary alloc]initWithObjectsAndKeys:@"华山",@"1",@"泰国",@"2",@"天津",@"3",@"台湾",@"4",@"泰国",@"5", nil];
    NSLog(@"\n dict001 = %@ \n", dict001);
    
    // 属性
    // 1 个数
    NSInteger count = dict001.count;
    NSLog(@"\n count = %ld \n", count);
    
    // 2 所有的键
    NSArray *keyArray = dict001.allKeys;
    NSLog(@"\n");
    for (NSString *string in keyArray)
    {
        NSLog(@"string = %@", string);
    }
    
    // 3 所有的值
    NSArray *valueArray = dict001.allValues;
    NSLog(@"\n");
    for (NSString *string in valueArray)
    {
        NSLog(@"string = %@", string);
    }
    
    
    
    
    //——————————————————————————//
    self.scrollV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, imagW, imagH)];
    self.scrollV.contentSize=CGSizeMake(ScrollViewImageCount *imagW, 0);
    self.scrollV.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:_scrollV];
    self.scrollV.showsHorizontalScrollIndicator=YES;
    self.scrollV.pagingEnabled=YES;
    for (int i=0; i<ScrollViewImageCount; i++) {
        UIImageView *image =[[UIImageView alloc]init];
        CGFloat imageX =i*imagW;
        image.frame =CGRectMake(imageX, imagY, imagW, imagH);
        image.image =[UIImage imageNamed:@"hd_mine"];
        [self.scrollV addSubview:image];
    }
    
   
   
    


    _pageCtr =[[UIPageControl alloc]initWithFrame:CGRectMake(imagW/2-50/2, imagH-12, 50, 10)];
    _pageCtr.currentPageIndicatorTintColor =[UIColor greenColor];
    [self.view addSubview:_pageCtr];
    self.pageCtr.numberOfPages=ScrollViewImageCount;
    self.pageCtr.currentPage=0;
 //   [self addTimer];
    
    
    
}
-(void)movefrontController{
    
    
}
-(void)moveNextController{
    
    [self.navigationController pushViewController:[MessageDetailController new] animated:UIViewAnimationCurveEaseIn];
   
    
    
}

//-(UIScrollView *)scrollV{
//    if (self.scrollV==nil) {
//        for (int i=0; i<ScrollViewImageCount; i++) {
//            UIImageView *image =[[UIImageView alloc]init];
//            CGFloat imageX =i*imagW;
//            image.frame =CGRectMake(imageX, imagY, imagW, imagH);
//            image.image =[UIImage imageNamed:@"hd_mine"];
//            [self.scrollV addSubview:image];
//        }
//
//        self.scrollV.contentSize=CGSizeMake(ScrollViewImageCount *imagW, 0);
//        self.scrollV.showsHorizontalScrollIndicator=YES;
//        self.scrollV.pagingEnabled=YES;
//        [self.view addSubview:_scrollV];
//        self.pageCtr.numberOfPages=ScrollViewImageCount;
//
//        [self addTimer];
//    }
//    return self.scrollV;
//}
//-(UIPageControl *)pageCtr{
//    if (!_pageCtr) {
//    _pageCtr.currentPage = 0;
//    _pageCtr =[[UIPageControl alloc]initWithFrame:CGRectMake(imagW/2-50/2, imagH-20-10, 50, 20)];
//    _pageCtr.pageIndicatorTintColor = [UIColor whiteColor];
//    _pageCtr.currentPageIndicatorTintColor =[UIColor greenColor];
//    [self.scrollV addSubview:_pageCtr];
//    }
//    return _pageCtr;
//}

//-(void)setPageCtr:(UIPageControl *)pageCtr{
//    _pageCtr =pageCtr;
//
//
//}
-(void)addTimer{
    self.timer =[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextImage{
   
    if (self.pageCtr.currentPage ==ScrollViewImageCount-1){
//        [self.timer invalidate];
        self.pageCtr.currentPage=0;
       
    }else{
        NSLog(@"%ld",(long)self.pageCtr.currentPage);
        self.pageCtr.currentPage +=1;
//        page +=1;
    }
    
    
    CGFloat offsetx =self.pageCtr.currentPage *imagW;
    NSLog(@"%f",offsetx);
    CGPoint offset = CGPointMake(offsetx, 0);
    [self.scrollV setContentOffset:offset animated:YES];
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",self.scrollV.contentOffset.x);
    int page =self.scrollV.contentOffset.x /imagW;
    self.pageCtr.currentPage=page;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // 移除定时器
    [self removeTimer];
}

/**
 *  用户已经停止滚动
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    // 开启定时器
    [self addTimer];
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
