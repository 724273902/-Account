//
//  MBProgressHUD+ZXProgressHud.h
//  易教
//
//  Created by john wall on 2018/7/6.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ZXProgressHud)
+(void)showCustomIcon:(NSString*)iconName title:(NSString *)title toView:(UIView *)view;

+(void)showSucess:(NSString *)success toview:(UIView *)view;

+ (void)showError:(NSString *)error ToView:(UIView *)view;


+ (void)showWarn:(NSString *)Warn ToView:(UIView *)view;

+ (void)showInfo:(NSString *)Info ToView:(UIView *)view;

+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showAutoMessage:(NSString *)message;

+ (void)showAutoMessage:(NSString *)message ToView:(UIView *)view;


+(void)showIconMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time;

+(void)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time;

+ (void)showLoadToView:(UIView *)view;

+ (MBProgressHUD *)showProgressToView:(UIView *)view Text:(NSString *)text;

+ (void)hideHUDForView:(UIView *)view;

+ (void)hideHUD;
@end
