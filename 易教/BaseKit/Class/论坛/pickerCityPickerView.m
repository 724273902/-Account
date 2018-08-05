//
//  pickerCityPickerView.m
//  易教
//
//  Created by john wall on 2018/7/9.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "pickerCityPickerView.h"

@interface pickerCityPickerView ()
@property(nonatomic,strong)UIPickerView *picker;
@property(nonatomic,strong)UIView *pickerContent;

@end

@implementation pickerCityPickerView{
    
    NSArray *proviceArray;
    NSArray *cityArray;
    NSArray *districtArray;
    NSString *provinceName;
    NSString *provinceId;
    NSString *cityName;
    NSString *districtName;
    
    NSMutableDictionary *cityDic;
    NSMutableDictionary *districDic;
    
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self =[super initWithCoder:aDecoder];
    
    self.frame = CGRectMake(0, 0, YPScreenW, YPScreenH);
    self.backgroundColor=[UIColor blackColor];
    [self creatdata];
    [self  setviews];
    
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
        
       
          self.frame = CGRectMake(0, 0, YPScreenW, YPScreenH);
        self.backgroundColor=[UIColor blackColor];
         [self creatdata];
         [self  setviews];
    }
    
    return self;
    
}


- (void)creatdata {
    NSString *plistPath =[[NSBundle mainBundle]pathForResource:@"area" ofType:@"xml"];
    
    NSString *str=[NSString stringWithContentsOfFile:plistPath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *listDic =[NSJSONSerialization JSONObjectWithData:[str
                                                                    dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dic=[listDic objectForKey:@"list"];
    proviceArray=[dic objectForKey:@"province"];
    
    cityDic =[[NSMutableDictionary alloc]init];
    districDic=[[NSMutableDictionary alloc]init];
    
    for (int i=0; i<proviceArray.count; i++) {
        NSDictionary *provinceDic =[proviceArray objectAtIndex:i];
        provinceName=[provinceDic objectForKey:@"name" ];
        provinceId=[provinceDic objectForKey:@"id" ];
        
        
    if ([[provinceDic objectForKey:@"city"] isKindOfClass:[NSArray class]]) {
            cityArray =[provinceDic objectForKey:@"city"];
    
            for ( int i=0; i<cityArray.count;i++) {
                NSDictionary *cityDic =[cityArray objectAtIndex:i];
                cityName=  [cityDic objectForKey:@"name"];
                districtArray=[cityDic objectForKey:@"region"];
                if (districtArray.count !=0) {
                    [districDic setObject:districtArray forKey:cityName];
                }
            }
            [cityDic setObject:cityArray forKey:provinceName];
    }else if([[provinceDic objectForKey:@"city"] isKindOfClass:[NSDictionary class]]){
        NSMutableArray *cityarr =[NSMutableArray array];
        NSMutableDictionary *dic =[NSMutableDictionary dictionary];
        [dic setObject:provinceName forKey:@"name"];
        [dic setObject:provinceId forKey:@"id"];
        [cityarr addObject:dic];
        [cityDic setObject:cityarr forKey:provinceName];
        
        NSDictionary *cityArray1 = [provinceDic objectForKey:@"city"];
         cityName=  [cityArray1  objectForKey:@"name"];
        districtArray = [cityArray1 objectForKey:@"region"];
        if (districtArray.count != 0) {
            //存入字典 城市 对应 区县
            [districDic setObject:districtArray forKey:cityName];
          }
        }
    }
}
-(void)setviews{
    
    
    self.backgroundColor = [UIColor colorWithRed:255 green:201 blue:34 alpha:.4];

    UITapGestureRecognizer *baseViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baseViewTapAction:)];
    [self addGestureRecognizer:baseViewTap];
    
    /********/
    
    

    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 190, _pickerContent.frame.size.width, .5)];
    lineLabel.backgroundColor = [UIColor purpleColor];
    [_pickerContent addSubview:lineLabel];
    
    UILabel *lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake((YPScreenW-60)/2, 190, .5, 55)];
    lineLabel2.backgroundColor =[UIColor purpleColor];
    [_pickerContent addSubview:lineLabel2];
    
    CGFloat btnWhidth=(YPScreenW-60)/2;
    
    //取消
    UIButton *cancleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBt.frame = CGRectMake(0, 190+10, btnWhidth, 35);
    [cancleBt setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBt addTarget:self action:@selector(cancleAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancleBt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_pickerContent addSubview:cancleBt];
    
    //确定
    UIButton *confirmBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBt addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    confirmBt.frame = CGRectMake(btnWhidth, 190+10, btnWhidth, 35);
    [confirmBt setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_pickerContent addSubview:confirmBt];
    
   
     [_pickerContent addSubview:_picker];
  
    //    _componentWithThreeNum=country.count;
    //    _componentWithThreeArr=country;
    //    cityId =citys[0][@"id"];
    //    districtId = _str3[0][@"id"];
   
   
}

-(UIPickerView *)picker{
    
    if (!_picker) {
        _picker = [[UIPickerView alloc] initWithFrame: CGRectMake(0, 5, YPScreenW-60, 190)];
        _picker.dataSource = self;
        _picker.delegate = self;
        //   _picker.showsSelectionIndicator = YES;
        //    [_picker selectRow: 0 inComponent:0 animated: YES];
        //    [_picker reloadAllComponents];
        //    NSInteger rowProvince = [_picker selectedRowInComponent:0];
        //    NSString *provinceName = proviceArray[rowProvince][@"name"];
        //    cityArray = cityDic[provinceName];
        //    NSInteger rowCity = [_picker selectedRowInComponent:1];
        //    NSString *cityName =cityArray[rowCity][@"name"];
        //    districtArray = districDic[cityName];
    }
    return _picker;
}

-(UIView*)pickerContent{
    if (!_pickerContent) {
        [self addSubview:_pickerContent];
        _pickerContent = [[UIView alloc] initWithFrame:CGRectMake(30, (YPScreenH-245)/2, YPScreenW-60, 245)];
        _pickerContent.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _pickerContent;
}
#pragma actions & methods
- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:( r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
#pragma mark action
- (void)cancleAction:(UIButton *)sender
{
    [self removeFromSuperview];
}

- (void)confirmAction:(UIButton *)sender
{
    //    [addressBtn setTitle:[NSString stringWithFormat:@"%@ %@ %@",provinceStr,cityStr,districtStr] forState:UIControlStateNormal];
    
    //block回调
    if (_block) {
        
        _block(provinceName,cityName,districtName);
    }
    
    [self removeFromSuperview];
}
- (void)baseViewTapAction:(UITapGestureRecognizer *)tap
{
    [self removeFromSuperview];
    //    self = nil;
}
#pragma mark datasource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
             return proviceArray.count;
            break;
        case 1:
            return cityArray.count  ;
            break;
        case 2:
            return districtArray.count;
            break;
      
    }
    return 0;

}
#pragma mark delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        provinceName=proviceArray[row][@"name"];
        return provinceName;
    }else if(component == 1){
        cityName =cityArray[row][@"name"];
        return cityName;
    }else if(component == 2){
        
        if ([districtArray isKindOfClass:[NSDictionary class]]){
            NSDictionary *dic=(NSDictionary *)districtArray;
            districtName = dic[@"name"];
        }else{
            districtName = districtArray[row][@"name"];
        }
        
        return districtName;
    }
    
    return nil;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label =(UILabel *)view;
    if (!label) {
        label=[[UILabel alloc]init];
        label.frame =CGRectMake(0, 0, (YPScreenW-60-40)/3, 25);
        label.adjustsFontSizeToFitWidth=YES;
        label.numberOfLines =0;
        label.textAlignment=NSTextAlignmentCenter;
        label.font= [UIFont boldSystemFontOfSize:15];
    }
    label.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerView;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return (YPScreenW -60)/3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 25;
}


//didSelectRow

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component ==0) {
    
    
       NSInteger p =[pickerView selectedRowInComponent:0];
        NSString *pname =proviceArray[p][@"name"];
        cityArray=cityDic[pname];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        NSInteger c =[pickerView selectedRowInComponent:1];
    
        NSString *cityname =cityArray[c][@"name"];
        districtArray =districDic[cityname];
        [pickerView reloadComponent:2];
    }else if (component ==1){
    
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = proviceArray[rowProvince][@"name"];
        cityArray = cityDic[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        if (cityArray.count-1<rowCity) {
            
        }else{
            NSString *cityName =cityArray[rowCity][@"name"];
            districtArray= districDic[cityName];
            [pickerView reloadAllComponents];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            
        }
    }else if (component ==2){
        
        
    }
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
