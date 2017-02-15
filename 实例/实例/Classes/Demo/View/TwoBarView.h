//
//  TwoBarView.h
//  实例
//
//  Created by 胡碧涛 on 2017/2/9.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoBarView : UIView
@property(nonatomic,strong)NSArray * xArray;  //x轴显示的刻度
@property(nonatomic,strong)NSArray * yArray;  //y轴显示的下标内容
@property(nonatomic,strong)NSMutableArray *dataArray;  //需要显示的数据
@property(nonatomic,assign)int minValue ;//最小值
@property(nonatomic,assign)int equalValue; //等差值
@end
