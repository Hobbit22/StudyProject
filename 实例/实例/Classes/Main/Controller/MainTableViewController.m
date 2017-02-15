//
//  MainTableViewController.m
//  实例
//
//  Created by 胡碧涛 on 2016/12/20.
//  Copyright © 2016年 hubitao.com.study. All rights reserved.
//

#import "MainTableViewController.h"
#import "CirculeButtonViewController.h"
#import "PackageTableViewController.h"
#import "ImageViewController.h"
#import "BarViewController.h"
#import "CircleViewController.h"
#import "BraceletHomeViewController.h"
#import "ImageCutViewController.h"
#import "LocalSaveViewController.h"
#import "DemoController.h"

@interface MainTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSArray *dataArr;
@end

@implementation MainTableViewController
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        NSArray *dataArray = @[@"弹出式按钮", @"封装TableView", @"练习", @"设置", @"柱状图", @"扇形图", @"首页", @"图片裁剪", @"本地存储"];
        _dataArr = dataArray;
    }
    
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  = @"特效实例";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseId = @"main";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CirculeButtonViewController *circule = [[CirculeButtonViewController alloc] init];
    PackageTableViewController *package = [[PackageTableViewController alloc] init];
    ImageViewController *image = [[ImageViewController alloc] init];
    BarViewController *bar = [[BarViewController alloc] init];
    CircleViewController *circle = [[CircleViewController alloc] init];
    BraceletHomeViewController *bracelet = [[BraceletHomeViewController alloc] init];
    ImageCutViewController *imageCut = [[ImageCutViewController alloc] init];
    LocalSaveViewController *save = [[LocalSaveViewController alloc] init];
    DemoController *demo = [[DemoController alloc] init];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:circule animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:package animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:demo animated:YES];
            break;
        case 3:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Photos"]];
            break;
        case 4:
            [self.navigationController pushViewController:bar animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:circle animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:bracelet animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:imageCut animated:YES];
        case 8:
            [self.navigationController pushViewController:save animated:YES];
            break;
        default:
            break;
    }
}

@end
