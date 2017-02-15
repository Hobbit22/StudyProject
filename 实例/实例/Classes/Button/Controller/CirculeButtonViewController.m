//
//  CirculeButtonViewController.m
//  实例
//
//  Created by 胡碧涛 on 2016/12/20.
//  Copyright © 2016年 hubitao.com.study. All rights reserved.
//

#import "CirculeButtonViewController.h"

@interface CirculeButtonViewController ()
@property (nonatomic, weak)UIButton *clickButton;
@end

@implementation CirculeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *buttonArray = @[@"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_music", @"tabbar_compose_photo"];
    for (NSInteger i = 0; i < buttonArray.count; i ++) {
        NSString *buttonImg = buttonArray[i];
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(100, 100, 50, 50);
        button.tag = i;
        [button setImage:[UIImage imageNamed:buttonImg] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.frame = CGRectMake(100, 100, 50, 50);

    [clickButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];

    clickButton.backgroundColor = [UIColor whiteColor];
    clickButton.layer.cornerRadius = clickButton.frame.size.width * 0.5;
    [self.view addSubview:clickButton];
}

@end
