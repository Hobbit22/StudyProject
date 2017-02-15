//
//  CircleViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/15.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "CircleViewController.h"

@interface CircleViewController ()
@property (nonatomic, weak)UIImageView *userHead;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建个人主页头部的用户头像
    UIImageView *userHead = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 80, 80)];
    self.userHead = userHead;

    self.userHead.image = [UIImage imageNamed:@"111.jpg"];
    
    //创建圆形遮罩，把用户头像变成圆形
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:40 startAngle:-M_PI_2 endAngle:0.3*M_PI * 2 - M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(40, 40)];
    CAShapeLayer* shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    self.userHead.layer.mask = shape;
    [self.view addSubview:self.userHead];
}


@end
