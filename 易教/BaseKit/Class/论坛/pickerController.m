//
//  pickerController.m
//  易教
//
//  Created by john wall on 2018/7/9.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "pickerController.h"
#import "pickerCityPickerView.h"
#import "WSCityPicker.h"
@interface pickerController ()

@end

@implementation pickerController

- (void)viewDidLoad {
    [super viewDidLoad];

 
   self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, YPScreenW-40, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"选择城市" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnAction:(UIButton *)btn {
    
    WSCityPicker *wsPk =[[WSCityPicker alloc]initWithFrame:CGRectMake(0, 0, YPScreenW, YPScreenH)];
   // pickerCityPickerView *wsPk = [[pickerCityPickerView alloc]initWithFrame:CGRectMake(0, 0, YPScreenW, YPScreenH)];
    [self.view addSubview:wsPk];
    [wsPk setBlock:^void(NSString *provinceStr,NSString *cityStr,NSString *districtStr){
        
        [btn setTitle:[NSString stringWithFormat:@"%@-%@-%@",provinceStr,cityStr,districtStr] forState:UIControlStateNormal];
    }];
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
