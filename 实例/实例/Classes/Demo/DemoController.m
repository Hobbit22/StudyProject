//
//  DemoController.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/10.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "DemoController.h"
#import "TowiceBarViewController.h"
#import "UIView+Extension.h"

// 屏幕宽
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
// 屏幕高
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

@interface DemoController ()

@end

@implementation DemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试练习";
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *blockView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 212, 30)];
    blockView.backgroundColor = [UIColor redColor];
    [self.view addSubview:blockView];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(70, 0, 1, 30)];
    lineView1.backgroundColor = [UIColor blackColor];
    [blockView addSubview:lineView1];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(140, 0, 1, 30)];
    lineView2.backgroundColor = [UIColor blackColor];
    [blockView addSubview:lineView2];
    
    UIButton *barChart = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    [barChart setTitle:@"柱状图" forState:UIControlStateNormal];
    [barChart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [barChart addTarget:self action:@selector(pushChart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:barChart];
    
    UIView *discribeView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth-200, 240, 160, 15)];
    discribeView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:discribeView];
    
    UIButton *deepSleepButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deepSleepButton.frame = CGRectMake(0, 0, discribeView.width/2, 15);
    UIButton *lightSleepButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lightSleepButton.frame = CGRectMake(discribeView.width/2, 0, discribeView.width/2, 15);
    [deepSleepButton setImage:[UIImage imageNamed:@"col_02"] forState:UIControlStateNormal];
    [lightSleepButton setImage:[UIImage imageNamed:@"col_01"] forState:UIControlStateNormal];
    deepSleepButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 65);
    lightSleepButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 65);
    [deepSleepButton setTitle:@"深睡眠" forState:UIControlStateNormal];
    [lightSleepButton setTitle:@"浅睡眠" forState:UIControlStateNormal];
    deepSleepButton.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    lightSleepButton.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [deepSleepButton setTitleColor:[UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1.0] forState:UIControlStateNormal];
    [lightSleepButton setTitleColor:[UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1.0] forState:UIControlStateNormal];
    deepSleepButton.titleEdgeInsets = UIEdgeInsetsMake(0, -60, 0, 0);
    lightSleepButton.titleEdgeInsets = UIEdgeInsetsMake(0, -60, 0, 0);
    [discribeView addSubview:deepSleepButton];
    [discribeView addSubview:lightSleepButton];
}

- (void)pushChart{
    TowiceBarViewController *tow = [[TowiceBarViewController alloc] init];
    [self.navigationController pushViewController:tow animated:YES];
}

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
