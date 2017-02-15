//
//  UIImage+Extension.h
//  实例
//
//  Created by 胡碧涛 on 2017/1/15.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
*  水印图片
*
*  @param bg  背景图片名字
*  @param logo logo图片名字
*
*/
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo;
/**
 *  图片裁剪
 *
 *  @param name        要裁剪的图片名字
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  屏幕截图
 *
 *  @param view 需要截的view
 *
 */
+ (instancetype)captureWithView:(UIView *)view;
@end
