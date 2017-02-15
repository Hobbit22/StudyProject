//
//  TowiceBarViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/9.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "TowiceBarViewController.h"
#import "TwoBarView.h"

@interface TowiceBarViewController ()

@end

@implementation TowiceBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scro2=[[UIScrollView alloc]initWithFrame:CGRectMake(50, 250, 300, 200)];
    scro2.contentSize=CGSizeMake(45+9*50+100, 0);
    [self.view addSubview:scro2];
    
    TwoBarView *zhuVC=[[TwoBarView alloc]initWithFrame:CGRectMake(0, 0, scro2.contentSize.width, 200)];
    zhuVC.yArray=@[@"2000",@"2100",@"2200",@"2300",@"2400",@"2500"];
    zhuVC.xArray=@[@"2001",@"2002",@"2003",@"2004",@"2005",@"2006",@"2004"];
    NSArray *dataOneArray=@[@"2200",@"1000",@"2200",@"2400",@"2400",@"2300",@"2400"];
    NSArray *dataTwoArray=@[@"2300",@"2100",@"2000",@"2400",@"2300",@"2200",@"2400"];
    zhuVC.minValue=2000;
    zhuVC.equalValue=100;
    zhuVC.dataArray=[NSMutableArray arrayWithObjects:dataOneArray,dataTwoArray, nil];
    [scro2 addSubview:zhuVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
