//
//  UIButton+ZXBtn.h
//  易教
//
//  Created by john wall on 2018/7/6.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef   void(^touchdBlock)(NSUInteger tag);
@interface UIButton (ZXBtn)


-(void)addActionHandler:(touchdBlock)touchdHandler;

-(void)setBackgroundColor:(UIColor *)backgroundColor  forstate:(UIControlState)state;

-(instancetype)initWithFrame:(CGRect)frame buttonTitle:(NSString *)buttontitle normalBGCorlor:(UIColor *)normalBGCorlor selectBGColor:(UIColor *)selectBGColor normalColor:(UIColor *)normalColor selectColor:(UIColor *)selectCorlor buttonFont:(UIFont *)buttonFont cornorRadius:(CGFloat )cornerRadius doneBlock:(void (^)(UIButton *))doneBlock;
@end


#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ACRoundBtn:UIButton
@property (nonatomic, assign)  int style;
@end











