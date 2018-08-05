//
//  MBProgressHUD+ZXProgressHud.m
//  易教
//
//  Created by john wall on 2018/7/6.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "MBProgressHUD+ZXProgressHud.h"

@implementation MBProgressHUD (ZXProgressHud)

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error ToView:(UIView *)view{
    [self showCustomIcon:@"MBHUD_Error" title:error toView:view];
}
+ (void)showSuccess:(NSString *)success ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Success" title:success toView:view];
}

+ (void)showInfo:(NSString *)Info ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Info" title:Info toView:view];
}

+ (void)showWarn:(NSString *)Warn ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Warn" title:Warn toView:view];
}

//加载视图
+(void)showLoadToView:(UIView *)view{
    [self showMessage:@"加载中..." ToView:view];
}
//快速消失
+(void)showAutoMessage:(NSString *)message ToView:(UIView *)view{
    
    [self showMessage:message ToView:view RemainTime:1 Model:MBProgressHUDModeText];
}

+(void)hideHUDForView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
    
}
#pragma mark customIcon
+(void)showCustomIcon:(NSString *)iconName title:(NSString *)title toView:(UIView *)view{
    if(view ==nil)
    view =(UIView *)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text =title;
    hud.label.font=adaptedFontSize(15);
    hud.customView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:iconName]];
    hud.mode =MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide=YES;
    hud.backgroundView.style=MBProgressHUDBackgroundStyleBlur;
    [hud hideAnimated:YES afterDelay:2.0f];
    
    
}

#pragma mark showMessage
+ (MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.label.text=message;
    hud.label.font= [UIFont systemFontOfSize:15];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
    
    //    hud.dimBackground = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    return hud;
}

#pragma mark ProgressView
+(MBProgressHUD *)showProgressToView:(UIView *)view Text:(NSString *)text{
   view =(UIView *)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode =MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text=text;
    hud.label.font= adaptedFontSize(15);
    // 代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleBlur;
    
    return hud;
}
#pragma mark 几秒后消失
+(void)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time Model:(MBProgressHUDMode)model{
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text=message;
    hud.label.font= [UIFont systemFontOfSize:15];
    //模式
    hud.mode = model;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // X秒之后再消失
    [hud hideAnimated:YES afterDelay:time];
    
}

@end
