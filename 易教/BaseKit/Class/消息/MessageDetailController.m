//
//  MessageDetailController.m
//  易教
//
//  Created by john wall on 2018/7/18.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "MessageDetailController.h"

@interface MessageDetailController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIButton *btn;
@end

@implementation MessageDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor =[UIColor redColor];
//    NSArray *familyFonts = [UIFont familyNames];
//    for (NSString * fontStr in familyFonts) {
//        NSArray *fonts = [UIFont fontNamesForFamilyName:fontStr];
//        for (NSString *fontStr in fonts) {
//            NSLog(@"fontStr =  %@" , fontStr);
//        }
//    }
    
    
    _btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 100, YPScreenW, YPScreenH/4)];
    [self.view addSubview:_btn];
   _btn.backgroundColor=[UIColor purpleColor];
    UITapGestureRecognizer *tap=  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(donesome)];
    [_btn addGestureRecognizer:tap];
    
      UITapGestureRecognizer *tap2=  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forsweet)];
    [self.view addGestureRecognizer:tap2];
    /*字符串实战作战*/
    NSString *s4=  [[NSString alloc]initWithUTF8String:"jin"];
   NSLog(@"s4_________ %@" , s4);
    const  char *cs=    [s4 UTF8String];
    NSLog(@"cs________ %s" , cs);
    
    NSURL *url=[[NSURL alloc] initWithString:@"file:///Users/johnwall/Desktop/3.txt"];
    NSString *s6=[[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"\ns6______-%@",s6);
    NSString *s5=[[NSString alloc] initWithContentsOfFile:@"/Users/johnwall/Desktop/密码 网址.rtf"encoding:NSUTF8StringEncoding  error:nil];
     NSLog(@"\ns5______-_%@",s5);
    NSString *sss=    [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSString *sssss=[[NSString alloc]initWithUTF8String:"dddd"];
    [sss writeToFile:@"/users/johnwall/desktop/2.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"\nsss++++++++%@",sss);
    char c=[sssss  characterAtIndex: 3];
    NSLog(@" c-------%c",c);
    NSString *str=@"1,2,3,4,5,6,7,8";
    NSArray *array=[str componentsSeparatedByString:@","];
    NSLog(@" %@",array);
    
    BOOL b = [@"liuxun" hasPrefix:@"liu"];//判断某字符串是否以另一串开头
    BOOL b1 = [@"liuxun" hasSuffix:@"xun"];//判断某字符串是否以另一串结尾
    NSLog(@"b= %d b1=%d",b,b1);
    //查找字符串中某个字串的范围
    NSRange range=[@"liuxun1993" rangeOfString:@"xun"];
    NSLog(@"location=%ld length= %ld",range.location,range.length);
    //查找某个下标的字符
    char cah=[@"liuxun" characterAtIndex:4];
      NSLog(@"cah_______=%c",cah);
    //使用资源对象方法将字符串写到指定的3.txt文件中(不手动带协议头的URL方法)
    NSString *t = @"苦心人天不负,\n卧薪尝胆,\n三千越甲可吞吴\n";
    NSURL *url3 = [[NSURL alloc] initFileURLWithPath:@"/Users/johnwall/Desktop/3.txt"];

    [t writeToURL:url3 atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

-(void)donesome{
    
    self.view.backgroundColor =[UIColor blueColor];
}
-(void)forsweet{
    self.view.alpha=0.4;
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isKindOfClass:[UIView class]]) {
        return NO;
    }
        CGPoint location =[touch locationInView:self.view];
        if(CGRectContainsPoint(_btn.frame, location)) {
        return NO;
    }else{
        return YES;
    }
}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//
//    return NO;
//}
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
