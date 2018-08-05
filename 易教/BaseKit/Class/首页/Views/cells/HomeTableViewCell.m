//
//  HomeTableViewCell.m
//  易教
//
//  Created by john wall on 2018/3/24.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    

    _Iconlabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 30)];
    _IconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 30, 30, 30)];
    _Iconlabel.backgroundColor=[UIColor blueColor];
    _IconImageView.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:_IconImageView];
    [self.contentView addSubview:_Iconlabel];
    self.contentView.backgroundColor=[UIColor blueColor];
    self.contentView.frame =CGRectMake(0, 0, 300, 100);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
