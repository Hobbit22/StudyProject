//
//  UIColor+HexToColo.m
//  UCard
//
//  Created by 樊建政 on 17/1/12.
//  Copyright © 2017年 Synjones. All rights reserved.
//

#import "UIColor+HexToColo.h"

@implementation UIColor (HexToColo)
+ (UIColor *)colorWithRGBString:(NSString *)color {
    UIColor *rgbColor = [UIColor clearColor];
    NSString *cString = [[color uppercaseString] copy];
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    else if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return rgbColor;
    
    NSRange range = NSMakeRange(0, 2);
    
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    rgbColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return rgbColor;
}

@end
