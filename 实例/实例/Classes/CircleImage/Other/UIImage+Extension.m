//
//  UIImage+Extension.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/15.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
#pragma mark - 图片水印
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo
{
    UIImage *bgImage = [UIImage imageNamed:bg];
    // 上下文 : 基于位图(bitmap) ,  所有的东西需要绘制到一张新的图片上去
    // 1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    // size : 新图片的尺寸
    // opaque : YES : 不透明,  NO : 透明
    // 这行代码过后.就相当于创建一张新的bitmap,也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 画右下角的水印
    UIImage *logoImage = [UIImage imageNamed:logo];
    CGFloat scale = 0.2;
    CGFloat logoW = logoImage.size.width * scale;
    CGFloat logoH = logoImage.size.height * scale;
    CGFloat margin = 5;
    CGFloat logoX = bgImage.size.width - logoW - margin;
    CGFloat logoY = bgImage.size.height - logoH - margin;
    CGRect rect = CGRectMake(logoX, logoY, logoW, logoH);
    [logoImage drawInRect:rect];
    
    // 从上下文中取得制作完毕的UIImage对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
#pragma mark - 圆形图片裁剪
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启位图上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    // size : 新图片的尺寸
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
#pragma mark - 屏幕截图
+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0);
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
