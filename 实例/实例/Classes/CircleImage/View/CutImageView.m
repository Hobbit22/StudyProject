//
//  CutImageView.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/3.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "CutImageView.h"

@implementation CutImageView

- (void)drawRect:(CGRect)rect {

    //画圆，以便以后指定可以显示图片的范围
    //获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
    //指定上下文中可以显示内容的范围就是圆的范围
    CGContextClip(ctx);
    UIImage *image2=[UIImage imageNamed:@"111.jpg"];
    
    [image2 drawAtPoint:CGPointMake(0, 0)];
}


@end
