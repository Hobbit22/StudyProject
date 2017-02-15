//
//  PackageTableViewController.m
//  实例
//
//  Created by 胡碧涛 on 2016/12/23.
//  Copyright © 2016年 hubitao.com.study. All rights reserved.
//

#import "PackageTableViewController.h"
#import "PackageTableView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface PackageTableViewController ()

@end

@implementation PackageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"封装TableView";
    self.view.backgroundColor = [UIColor redColor];
    PackageTableView *package = [[PackageTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    package.tableFooterView = [[UIView alloc] init];
    NSArray *dataArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"];
    package.dataArray = dataArray;
    
    [self.view addSubview:package];
}


@end
