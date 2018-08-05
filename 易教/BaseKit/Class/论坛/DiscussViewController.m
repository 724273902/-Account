//
//  DiscussViewController.m
//  易教
//
//  Created by john wall on 2018/3/23.
//  Copyright © 2018年 john wall. All rights reserved.
//

#import "DiscussViewController.h"
#import "UIView+LMJNjHuFrame.h"
#import "UIBarButtonItem+ZXBarButtonItem.h"
#import "UIButton+ZXBtn.h"
#import <DQAlertView.h>
#import "pickerController.h"
@interface DiscussViewController ()<DQAlertViewDelegate>
@property(nonatomic,copy)UIButton *buttonAlter;
@property(nonatomic,strong)DQAlertView *alter;
@property(nonatomic,copy)UIButton *bun;
@end

@implementation DiscussViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationController.navigationBar.hidden=NO;
    //alterView
    _bun =[[UIButton alloc]initWithFrame:CGRectMake(100, 44, 100, 100)];
    _bun.tintColor=[UIColor redColor];
    _bun.backgroundColor=[UIColor lightGrayColor];
    [_bun setTitle:@"AlertShow"forState:UIControlStateNormal];
    [_bun addTarget:self action:@selector(setClickAlter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bun];
    [_bun addTarget:self action:@selector(setClickAlter) forControlEvents:UIControlEventTouchUpInside];
    //cityPicker
    UIButton *btnPicker =[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    btnPicker.tintColor=[UIColor redColor];
    btnPicker.backgroundColor=[UIColor lightGrayColor];
    [btnPicker setTitle:@"City Pick "forState:UIControlStateNormal];
    [btnPicker addTarget:self action:@selector(moveNextController) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnPicker];
  NSLog(@"\n%f\n%f\n%f\n%f\n%f\n%f\n",_bun.frame.origin.x,_bun.frame.origin.y,_bun.frame.size.width,_bun.frame.size.height,_bun.center.x,_bun.center.y);
    _bun.lmj_bottom=200;
    _bun.lmj_origin=CGPointMake(22, 64);
    _bun.lmj_size=CGSizeMake(100, 100);

    //bringTofrontView
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 350, 100, 100)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(15, 370, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    /**************************/
    NSLog(@"%ld",self.view.subviews.count);
    
    for (int i =0; i<self.view.subviews.count; i++) {
        NSLog(@"%@",self.view.subviews[i]);
    }
    //  下面这行代码能够将view2  调整到父视图的最下面
  //  [self.view sendSubviewToBack:view2];
    
    [self.view insertSubview:view1 atIndex:self.view.subviews.count];
    //下面这段代码是 将view1调整到父视图的最上面
  //  [self.view bringSubviewToFront:view2];


  // 导航栏
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"other" style:(UIBarButtonItemStyleDone) target:self action:@selector(moreConfig)];
    self.navigationItem.leftBarButtonItem=  [UIBarButtonItem initWithTitle:@"nothing" titleColor:[UIColor blueColor] target:self action:@selector(moveNextController)];
    //导航栏右边字体颜色
    NSDictionary *dic = [NSDictionary dictionaryWithObject:YPColor_RGB(123, 123, 123) forKey:NSForegroundColorAttributeName];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    


}
-(void)setClickAlter{
    self.alter =[[DQAlertView alloc]initWithTitle:@"是否移动alterView" message:@"移动" cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
    self.alter.appearAnimationType=DQAlertViewAnimationTypeFadeIn;
    self.alter.disappearAnimationType=DQAlertViewAnimationTypeZoomIn;
    self.alter.appearTime=1;
    
    
    [self.alter show];


    ZXWeakSelf(self);
    self.alter.cancelButtonAction = ^{
  
        [weakself.alter removeFromSuperview];
        [UIView animateWithDuration:1 delay:0.01 usingSpringWithDamping:.2 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            weakself.bun.lmj_centerY=400;
        } completion:^(BOOL finished) {
            NSLog(@"%f",weakself.bun.frame.size.width);
        }];
        
        
    };
    self.alter.otherButtonAction = ^{
        
        
        [UIView animateWithDuration:1 delay:0.01 usingSpringWithDamping:.7 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            weakself.bun.lmj_size=CGSizeMake(300,180);
        } completion:^(BOOL finished) {
            NSLog(@"%f",weakself.bun.frame.size.width);
        }];
        [weakself.alter removeFromSuperview];
    };
}
-(void)moreConfig{
    
    NSLog(@"%@",self);
}
-(void)moveNextController{
    
     [self.navigationController pushViewController:[[pickerController alloc]init] animated:YES];
}
#pragma mark DqAlertviewDelegate
-(void)otherButtonClickedOnAlertView:(DQAlertView *)alertView{

    
    
}
-(void)cancelButtonClickedOnAlertView:(DQAlertView *)alertView{
    
   
}

- (void)actionWithBlocksCancelButtonHandler:(void (^)(void))cancelHandler otherButtonHandler:(void (^)(void))otherHandler{
    

    
}

#pragma mark
// UIAlertView iOS8开始 被废弃
- (void)defaultAlertAction
{
    // iOS8被废弃
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"测试" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看",@"评论", nil];
    // 因为是默认样式，所以这里可以不用写这句代码
    alert.alertViewStyle = UIAlertViewStyleDefault;
    
    [alert show];
}




- (void)plainTextAction
{
    // iOS8被废弃
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"输入姓名" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}


- (void)secureTextAction
{
    // iOS8被废弃
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"输入姓名" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alert show];
}


- (void)loginAndPasswordAction
{
    // iOS8被废弃
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录",@"注册", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}
#pragma mark - UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}

- (void)actionSheetACtion
{
    // iOS8被废弃
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"查看",@"评论",@" 市场",@"大家", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%ld",buttonIndex);
}





#pragma mark - alertController
- (void)alertControllerAction {
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *showAllInfoAction = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *pickAction = [UIAlertAction actionWithTitle:@"评论" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:pickAction];
    [actionSheetController addAction:showAllInfoAction];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
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
