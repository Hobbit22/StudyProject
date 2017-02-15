//
//  ImageViewController.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/14.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "ImageViewController.h"
#import "DrawView.h"

@interface ImageViewController ()
@property (nonatomic, weak)UIView *circleView;
@property (nonatomic, weak)UIImageView *IconView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    circleView.backgroundColor = [UIColor colorWithRed:102/255.0 green:35/255.0 blue:78/2555.0 alpha:1.0];
    self.circleView = circleView;
    [self.view addSubview:circleView];
    DrawView *myView = [[DrawView alloc] init];
    myView.valueChange = 0.35;
    [circleView addSubview:myView];
//    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    self.IconView = iconView;
//    [circleView addSubview:self.IconView];
//    [self clipImage];
}

- (void)clipImage

{
//    1.加载原图
    UIImage *oldImage = [UIImage imageNamed:@"bg_huana"];
//    
//    2.获取位图上下文
    CGFloat bigCic = oldImage.size.width + 2 * 2;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bigCic, bigCic), NO, 0.0);
//    
//    3.画大圆
    [[UIColor whiteColor] set]; CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, bigCic *0.5, bigCic *0.5, bigCic *0.5, -M_PI_2, M_PI, 0);
    CGContextFillPath(ctx);
//    
//    4.画小圆
    CGFloat smallCic = oldImage.size.width *0.5;
    CGContextAddArc(ctx, bigCic *0.5 , bigCic *0.5, smallCic, 0, M_PI, 0);
    CGContextClip(ctx);
//    
//    5.画图
    [oldImage drawInRect:CGRectMake(2, 2, oldImage.size.width, oldImage.size.height)];
//    
//    6.获取新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    7.结束上下文
    UIGraphicsEndImageContext();
//    
//    8.显示新图
    self.IconView.image = newImage;
//    
//    9.写入到手机存储
    NSData *data = UIImagePNGRepresentation(newImage);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"newClip.png"];
    
    [data writeToFile:path atomically:YES];
}


@end
