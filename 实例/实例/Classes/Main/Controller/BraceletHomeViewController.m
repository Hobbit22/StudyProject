//
//  BraceletHomeViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/2.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "BraceletHomeViewController.h"
#import "UIView+Extension.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BraceletHomeViewController ()
@property (nonatomic, weak)UIView *menuView;
@end

@implementation BraceletHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.title = @"首页";
    // 卡信息，手环信息
    UIView *infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight/2-74)];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    // 菜单
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(0, infoView.maxY+10, kScreenWidth, kScreenHeight/2-10)];
    menuView.backgroundColor = [UIColor whiteColor];
    self.menuView = menuView;
    [self.view addSubview:menuView];
    
}

- (void)setupMenuUI{
    
}

@end
