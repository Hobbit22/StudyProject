//
//  BarViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/17.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "BarViewController.h"
#import "BarView.h"

@interface BarViewController ()
@property (nonatomic, weak)BarView *bar;
@end

@implementation BarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkGrayColor];
    UIView *boxView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 350, 230)];
    boxView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:boxView];
    BarView *bar = [[BarView alloc] initWithFrame:CGRectMake(0, 0, 340, 230)];
    self.bar = bar;
    bar.backgroundColor = [UIColor lightGrayColor];
    [boxView addSubview:bar];
}


@end
