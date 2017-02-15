//
//  LocalSaveViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/7.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "LocalSaveViewController.h"

@interface LocalSaveViewController ()

@end

@implementation LocalSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"本地存储";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *nmarr = [NSMutableArray array];
    
    NSMutableArray *arr1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"num"];
    
    for (NSInteger i = 0; i < arr1.count +1; i++) {
        if (i<arr1.count) {
        
            [nmarr addObject:arr1[i]];
        }else {
            [nmarr addObject:@4];
        }
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSLog(@"%@", docDir);
    /*NSMutableArray *nmarr = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        NSDictionary *dict = @{
                               @"a": @"哈哈",
                               @"b": @"哈哈",
                               @"c": @"哈哈",
                               @"d": @"哈哈",
                               @"e": @"哈哈",
                               };
        [nmarr addObject:dict];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        [userDefault setObject:dict forKey:[NSString stringWithFormat:@"arr%zd", i]];
        
        [userDefault synchronize];
    }*/

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:nmarr forKey:@"num"];
    
    [userDefault synchronize];
    
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
