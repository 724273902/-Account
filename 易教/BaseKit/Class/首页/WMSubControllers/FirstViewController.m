//
//  FirstViewController.m
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstCollectionViewCell.h"
#import "TableViewCell.h"
#import "HomeTableViewCell.h"

#import "BSJTopicCell.h"
#import "ZXViewModel.h"
#import "request.h"
#import "ZXItemParameter.h"
@interface FirstViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *MutableArr;
@property(nonatomic,strong)UIPageControl *pagecontrol;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UITableView *tv;


/*****/

@property(nonatomic,strong)request *requestService;
-(NSString *)areaType;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
   
//    self.tv =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, YPScreenW, YPScreenH) style:UITableViewStylePlain];
//    [self.view addSubview:self.tv];
//    self.tv.delegate= self;
//    self.tv.dataSource=self;
//    self.tv.backgroundColor=[UIColor redColor];
   
    
   // [self collectionViewInitForScrollview];
    
}
-(void)collectionViewInitForScrollview{
    
    UICollectionViewFlowLayout *flowLayout =[UICollectionViewFlowLayout new];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    flowLayout.itemSize=CGSizeMake(YPScreenW, 200);
    
    self.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, YPScreenW, 200) collectionViewLayout:flowLayout];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
  

    self.collectionView.pagingEnabled=YES;
    self.collectionView.showsHorizontalScrollIndicator=YES;
    self.collectionView.showsVerticalScrollIndicator=YES;
    
    [self.collectionView registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCellID"];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}
// 我们可以将第50个分区的一组图片作为用户看到的第一组图片，这样就实现轮播的效果了。（100分区足够了，除非脑残划100次）
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 自定义的Cell类
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCellID" forIndexPath:indexPath];
  
    int R   = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    cell.backgroundColor=  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    
  
    return cell;
    
}
-(void)setRandomCorlor{

   
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
#pragma mark TabelView
/******tableViewCell******/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.requestService.topicViewModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   BSJTopicCell *cell =[BSJTopicCell topicCellWithTableView:tableView];
  //  TableViewCell *cellOne = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
   
    cell.topicViewModel=self.requestService.topicViewModels[indexPath.row];
  
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.requestService.topicViewModels[indexPath.row].cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    
    
    
}

-(void)loadMoreSub:(BOOL)isMore{
    ZXWeakSelf(self);
    [self.requestService  getTopicMore:isMore typeA:self.areaType topicType:self.topicType completion:^(NSError *errror, NSInteger totalCount, NSInteger curretCount) {
        [weakself endHeaderFooterRefreshing ];
        
        
        
        if (errror) {
            NSLog(@"%@",errror.localizedDescription);
        }
        
        self.tableView.mj_footer.state =(curretCount >= totalCount)?MJRefreshStateNoMoreData:MJRefreshStateIdle;
        
        [self.tableView reloadData];
        
    }];
    
}

#pragma mark - getter

- (NSString *)areaType
{
    
    if ([self.parentViewController isMemberOfClass:NSClassFromString(@"WMPageViewController")]) {
        return @"list";
    }
    
    if ([self.parentViewController isMemberOfClass:NSClassFromString(@"BSJNewViewController")]) {
        return @"newlist";
    }
    
    return nil;
}
-(request *)requestService{
    
    if (_requestService == nil) {
        _requestService =[[request alloc]init];
    }
    return _requestService;
}






@end
