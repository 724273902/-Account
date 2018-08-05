//
//  pickerCityPickerView.h
//  易教
//
//  Created by john wall on 2018/7/9.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^MyBlock)(NSString *provinceStr,NSString *cityStr,NSString *districtStr);

@interface pickerCityPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,copy)MyBlock block;
@end
