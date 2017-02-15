//
//  UIView+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat width_2;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat height_2;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (assign, nonatomic, readonly) CGFloat maxX;
@property (assign, nonatomic, readonly) CGFloat maxY;
@property (assign, nonatomic, readonly) CGFloat minX;
@property (assign, nonatomic, readonly) CGFloat minY;

+ (instancetype)new;

/**
 * Set view's layer bound color
 */
- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadiuscornerRadius;

/**
 *  为视图添加线条
 *
 *  @param color     线条颜色
 *  @param isTopLine 是否为顶部的线条
 */
- (void)addLineViewWithColor:(UIColor *)color top:(BOOL)isTopLine;

- (void)addLineViewWithColor:(UIColor *)color height:(CGFloat)height;

















//用户头像改变
+(UIImage*)headerImage;

//水平方向比例
+(CGFloat)scaleForHorizontal:(NSInteger)hNum;
//垂直方向比例
+(CGFloat)scaleForVerticality:(NSInteger)vNum;
@end
