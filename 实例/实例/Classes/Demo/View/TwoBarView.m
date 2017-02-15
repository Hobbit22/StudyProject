//
//  TwoBarView.m
//  实例
//
//  Created by 胡碧涛 on 2017/2/9.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import "TwoBarView.h"
#import "UIColor+HexToColo.h"

#define x_Direct_Space  50.0  // x轴的间隙
#define xy_ruling_height 4    // 刻度的高
#define y_ruling_width  35   // y轴刻度的宽
#define y_arrow_height  30    //y轴箭头距离最近刻度的长度

@implementation TwoBarView
{
    float y_Space;   //y轴的间隙
    NSArray *colors;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        colors=@[[UIColor colorWithRGBString:@"7f8fef"],[UIColor colorWithRGBString:@"b1ede9"]];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    [[UIColor grayColor]setStroke];
    CGSize zeroSize=[@"0" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]}];
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, y_ruling_width+10, CGRectGetHeight(rect)-zeroSize.height-10-10);
    CGContextAddLineToPoint(context,y_ruling_width+10, 10);
    
    CGContextDrawPath(context, kCGPathStroke);
    [@"0" drawInRect:CGRectMake(y_ruling_width+10-zeroSize.width, CGRectGetHeight(rect)-zeroSize.height-10-10, zeroSize.width, zeroSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    //y轴的刻度
    y_Space=(CGRectGetHeight(rect)-(zeroSize.height+20)-y_arrow_height)/_yArray.count;
    for (int i=0;i<_yArray.count; i++) {
        CGContextMoveToPoint(context,  y_ruling_width+10, CGRectGetHeight(rect)-zeroSize.height-10-10-y_Space*(i+1));
        CGContextAddLineToPoint(context,   y_ruling_width+10+xy_ruling_height, CGRectGetHeight(rect)-zeroSize.height-10-10-y_Space*(i+1));
        CGContextDrawPath(context, kCGPathStroke);
        
        NSString *yStr=_yArray[i];
        CGSize ySize=[yStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]}];
        [yStr drawInRect:CGRectMake(5, CGRectGetHeight(rect)-zeroSize.height-10-10-y_Space*(i+1)-ySize.height*0.5, ySize.width, ySize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor grayColor]}];
    }
    //        先画出x轴
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, y_ruling_width+10, CGRectGetHeight(rect)-zeroSize.height-10-10);
    CGContextAddLineToPoint(context,CGRectGetWidth(rect)-y_ruling_width+10, CGRectGetHeight(rect)-zeroSize.height-10-10);
    CGContextDrawPath(context, kCGPathStroke);
    
    for (int i=0; i<_xArray.count; i++) {
        //     x轴的刻度
        
        CGContextMoveToPoint(context,  y_ruling_width+10+x_Direct_Space*(i+1), (CGRectGetHeight(rect)-zeroSize.height-10-10));
        CGContextAddLineToPoint(context,y_ruling_width+10+x_Direct_Space*(i+1),(CGRectGetHeight(rect)-zeroSize.height-10-10)-xy_ruling_height);
        CGContextDrawPath(context, kCGPathStroke);
        
        NSString *xStr=_xArray[i];
        CGSize xSize=[xStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]}];
        [xStr drawInRect:CGRectMake(y_ruling_width+10+x_Direct_Space*(i+1)- xSize.width*0.5, (CGRectGetHeight(rect)-zeroSize.height-10-10), xSize.width, xSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor grayColor]}];
        
    }
    //画矩形
    float retangleWidth=10;
    /*
     数组的的数量必须小于颜色数组的数量
     */
    if (_dataArray.count%2==0) {
        for (int j=0; j<_dataArray.count; j++) {
            NSArray *arr=_dataArray[j];
            [colors[j] setFill];
            for (int i=0; i<arr.count; i++) {
                NSString *valueStr=arr[i];
                float value=[valueStr floatValue];
                int num=(value-_minValue)/_equalValue;
                float f=(int)(value-_minValue)%_equalValue/_equalValue;
                CGMutablePathRef path=CGPathCreateMutable();
                CGRect retangleRect;
                if ((int)_dataArray.count/2-j>=0) {
                    retangleRect=CGRectMake(y_ruling_width+10+x_Direct_Space*(i+1)-(_dataArray.count/2-j)*retangleWidth, (CGRectGetHeight(rect)-zeroSize.height-10-10)-y_Space*(num+f+1), retangleWidth, y_Space*(num+f+1));
                }else{
                    retangleRect=CGRectMake(y_ruling_width+10+x_Direct_Space*(i+1)+(j-_dataArray.count/2)*retangleWidth, (CGRectGetHeight(rect)-zeroSize.height-10-10)-y_Space*(num+f+1), retangleWidth, y_Space*(num+f+1));
                }
                if (num<0) {
                    CGPathAddRect(path, nil, CGRectZero);
                }else{
                    CGPathAddRect(path, nil, retangleRect);
                }
                
                CGContextAddPath(context, path);
                CGContextDrawPath(context, kCGPathFill);
                
            }
        }
    }else{
        for (int j=0; j<_dataArray.count; j++) {
            NSArray *arr=_dataArray[j];
            [colors[j] setFill];
            for (int i=0; i<arr.count; i++) {
                float value=[arr[i] floatValue];
                int num=(value-2000)/100;
                float f=(int)(value-2000)%100/100;
                CGMutablePathRef path=CGPathCreateMutable();
                CGRect retangleRect;
                if (j<=_dataArray.count/2) {
                    retangleRect=CGRectMake(y_ruling_width+10+x_Direct_Space*(i+1)-(_dataArray.count/2-j+0.5)*retangleWidth, (CGRectGetHeight(rect)-zeroSize.height-10-10)-y_Space*(num+f+1), retangleWidth, y_Space*(num+f+1));
                }else{
                    retangleRect=CGRectMake(y_ruling_width+10+x_Direct_Space*(i+1)+(j-_dataArray.count/2-0.5)*retangleWidth, (CGRectGetHeight(rect)-zeroSize.height-10-10)-y_Space*(num+f+1), retangleWidth, y_Space*(num+f+1));
                }
                if (num<0) {
                    CGPathAddRect(path, nil, CGRectZero);
                }else{
                    CGPathAddRect(path, nil, retangleRect);
                }
                CGContextAddPath(context, path);
                CGContextDrawPath(context, kCGPathFill);
            }
        }
    }
}

@end
