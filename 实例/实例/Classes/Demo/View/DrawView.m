//
//  DrawView.m
//  实例
//
//  Created by 胡碧涛 on 2017/1/15.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

//设置 lable 的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}

//重写 set方法
- (void)setValueChange:(CGFloat)valueChange
{
    _valueChange = valueChange;
    
    //重绘
    [self setNeedsDisplay];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 0.加载图片
    
    UIImage *image = [UIImage imageNamed:@"bg_huana"];
    
    // 画圆形
    
    
    //OC
    //圆心
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    //半径
    CGFloat radius = MIN(rect.size.width * 0.4, rect.size.height * 0.4);
    //起始位置
    CGFloat startAngle =  - M_PI_2;
    
    //终点位置
    CGFloat endAngle = self.valueChange * M_PI * 2 - M_PI_2;
    
    
    //画圆
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:1];
    
    //从终点位置 到圆心画条线
    [path addLineToPoint:center];
    
    //渲染
    [path fill];
    

}


@end
