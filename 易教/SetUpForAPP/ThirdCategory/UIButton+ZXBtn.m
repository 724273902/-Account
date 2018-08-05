//
//  UIButton+ZXBtn.m
//  易教
//
//  Created by john wall on 2018/7/6.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "UIButton+ZXBtn.h"
#import "UIView+GestureCallback.h"
static const void *UIButtonBlockKey =&UIButtonBlockKey;
@implementation UIButton (ZXBtn)
-(void)addActionHandler:(touchdBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionTouched:(UIButton *)btn{
    touchdBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}



- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:nil
                    forState:state];
}

-(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (instancetype)initWithFrame:(CGRect)frame buttonTitle:(NSString *)buttonTitle normalBGColor:(UIColor *)normalBGColor selectBGColor:(UIColor *)selectBGColor
                  normalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor buttonFont:(UIFont *)buttonFont cornerRadius:(CGFloat )cornerRadius
                    doneBlock:(void(^)(UIButton *))doneBlock
{
    self = [self initWithFrame:frame];
    
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=cornerRadius;
    
    
    self.titleLabel.font=buttonFont;
    [self setTitle:buttonTitle forState:UIControlStateNormal];
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:selectColor forState:UIControlStateHighlighted];
//    [self setBackgroundImage:[UIImage imageWithColor:normalBGColor] forState:UIControlStateNormal];
//    [self setBackgroundImage:[UIImage imageWithColor:selectBGColor] forState:UIControlStateHighlighted];
    
    ZXWeakSelf(self);
    [self addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
        
        !doneBlock ?: doneBlock(weakself);
    }];
    
    return self;
}
@end
@implementation ACRoundBtn

-(void)makecorner{
    UIRectCorner corner;
    switch (self.style) {
            case 0:
            corner =UIRectCornerBottomLeft;
            break;
            case 1:
            corner = UIRectCornerBottomRight;
            break;
            case 2:
            corner = UIRectCornerTopLeft;
            break;
            case 3:
            corner = UIRectCornerTopRight;
            break;
            case 4:
            corner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
            case 5:
            corner = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
            case 6:
            corner = UIRectCornerBottomLeft | UIRectCornerTopLeft;
            break;
            case 7:
            corner = UIRectCornerBottomRight | UIRectCornerTopRight;
            break;
            case 8:
            corner = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerTopLeft;
            break;
            case 9:
            corner = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        default:
            corner = UIRectCornerAllCorners;
    }
    UIBezierPath *maskPath =[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(8, 8)];
    
    CAShapeLayer *masklayer =[CAShapeLayer layer];
    masklayer.frame=self.bounds;
    masklayer.path=maskPath.CGPath;
    self.layer.mask=masklayer;
    
}

-(void)layoutSubviews{
    [super layoutSubviews ];
    [self makecorner ];
}
@end

