//
//  ImageCutViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/3.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "ImageCutViewController.h"
#import "CutImageView.h"

@interface ImageCutViewController ()

@end

@implementation ImageCutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CutImageView *image = [[CutImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:image];
    self.view.backgroundColor = [UIColor whiteColor];
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
