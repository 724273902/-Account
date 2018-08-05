//
//  FourViewController.m
//  易教
//
//  Created by john wall on 2018/3/26.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "FourViewController.h"
#import "HomeTableViewCell.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionviewfour;
@property (weak, nonatomic) IBOutlet UITableView *tableviewfouur;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // self.tv =[[UITableView alloc]initWithFrame:CGRectMake(0, 300, YPScreenW, YPScreenH-300) style:UITableViewStylePlain];
    
   // [self.view addSubview:self.tv];
    [self.tableviewfouur registerClass:[HomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeTableViewCell class])];
    self.tableviewfouur.delegate= self;
    self.tableviewfouur.dataSource=self;
}
/******uitableviewcell******/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   HomeTableViewCell *cellOne = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class]) forIndexPath:indexPath];
    cellOne.IconImageView.image=[UIImage imageNamed:@"hd_home"];
    cellOne.Iconlabel.text=[NSString stringWithFormat:@"这是第一个cell"];
    
    
    return cellOne;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
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
