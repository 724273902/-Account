//
//  UIBarButtonItem+ZXBarButtonItem.h
//  易教
//
//  Created by john wall on 2018/3/26.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZXBarButtonItem)
/**
 *根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;

+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
@end
