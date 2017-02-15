//
//  UIView+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

+ (instancetype)new
{
    return [[super alloc] init];
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight_2:(CGFloat)height_2
{
    CGRect frame = self.frame;
    frame.size.height = height_2*2;
    self.frame = frame;
}

- (void)setWidth_2:(CGFloat)width_2
{
    CGRect frame = self.frame;
    frame.size.width = width_2*2;
    self.frame = frame;
}

- (CGFloat)height_2
{
    return self.height*.5;
}

- (CGFloat)width_2
{
    return self.width*.5;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)maxX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)maxY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)minX
{
    return self.frame.origin.x;
}

- (CGFloat)minY
{
    return self.frame.origin.y;
}

- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES;
    if (borderColor && 0 != borderWidth) {
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = borderWidth;
    }
    if (cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
    }
}

- (void)addLineViewWithColor:(UIColor *)color top:(BOOL)isTopLine {
    color = color?color:[UIColor colorWithWhite:0.875 alpha:1];
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, isTopLine?0:(self.height-0.5), self.width, 0.5);
    lineView.backgroundColor = color;
    [self addSubview:lineView];
}

- (void)addLineViewWithColor:(UIColor *)color height:(CGFloat)height {
    color = color?color:[UIColor colorWithWhite:0.875 alpha:1];
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, self.height-height, self.width, height);
    lineView.backgroundColor = color;
    [self addSubview:lineView];
}






























+(UIImage *)headerImage
{
    //读取图片
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"headerImage.png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    return savedImage;
}

//水平方向比例
+ (CGFloat)scaleForHorizontal:(NSInteger)hNum
{
    return  (CGFloat)hNum/(CGFloat)740 * [UIScreen mainScreen].bounds.size.width;
}

//垂直方向比例
+ (CGFloat)scaleForVerticality:(NSInteger)vNum
{
    return  (CGFloat)vNum/(CGFloat)1334*[UIScreen mainScreen].bounds.size.height ;
    
}


@end
