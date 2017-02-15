//
//  BarView.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/17.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "BarView.h"

#define kBarColor [UIColor colorWithRed:127/255.0 green:143/255.0 blue:239/255.0 alpha:1.0]
#define kBarColor2 [UIColor colorWithRed:177/255.0 green:237/255.0 blue:233/255.0 alpha:1.0]
@implementation BarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //数据数组
    self.dataArray1 = @[@20, @15, @70, @30, @20, @15, @70];
    self.dataArray2 = @[@25, @30, @40, @50, @25, @20, @60];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewH = self.bounds.size.height;
    
    NSUInteger count = self.dataArray1.count;
    CGFloat w = viewW / (count * 2 - 1);
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat y2 = 0;
    CGFloat h = 0;
    CGFloat h2 = 0;
    
    for (int i = 0; i < count; i ++) {
        
        x = i * (w - 1) * 2;
        h = ([self.dataArray1[i] integerValue] / 100.0) * viewH;
        y = viewH - h;
        
        //画矩形柱体
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w/2, h)];
        
        //填充对应颜色
        [(UIColor *)kBarColor set];
        
        CGContextAddPath(ctx, path.CGPath);
        
        //注意是Fill, 而不是Stroke, 这样才可以填充矩形区域
        CGContextFillPath(ctx);
        
        //文本绘制
        NSString *str = [NSString stringWithFormat:@"%ld", [self.dataArray1[i] longValue]];
        
        //创建文字属性字典
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:10];
        dic[NSForegroundColorAttributeName] = [UIColor blackColor];
        //设置笔触宽度
        dic[NSStrokeWidthAttributeName] = @1;
        
        //设置文字矩形的左上角位置,并且不会自动换行
        CGPoint p = CGPointMake(x-5 + w * 0.25, y - 20);

        //drawInRect:会自动换行
        //drawAtPoint:不会自动换行
        [str drawAtPoint:p withAttributes:dic];
        
    }
    for (NSInteger i = 0; i < self.dataArray2.count; i++) {
        x = i * (w - 1) * 2;
        
        h2 = ([self.dataArray2[i] integerValue] / 100.0) * viewH;
        
        y2 = viewH - h2;
        UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(x + w/2 + 3, y2, w/2, h2)];
        
        [(UIColor *)kBarColor2 set];
        
        CGContextAddPath(ctx2, path2.CGPath);
        
        CGContextFillPath(ctx2);
        
        NSString *str2 = [NSString stringWithFormat:@"%ld", [self.dataArray2[i] longValue]];
        //创建文字属性字典
        NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
        dic2[NSFontAttributeName] = [UIFont systemFontOfSize:10];
        dic2[NSForegroundColorAttributeName] = [UIColor blackColor];
        //设置笔触宽度
        dic2[NSStrokeWidthAttributeName] = @1;
        
        CGPoint p2 = CGPointMake(x-5 + 16 + w * 0.25, y2 - 20);
        [str2 drawAtPoint:p2 withAttributes:dic2];
    }
}


@end
