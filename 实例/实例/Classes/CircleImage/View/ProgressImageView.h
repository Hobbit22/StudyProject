//
//  ProgressImageView.h
//  实例
//
//  Created by 胡碧涛 on 2017/1/15.
//  Copyright © 2017年 hubitao.com.study. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressImageView : UIImageView
@property (nonatomic, weak)UIImageView *baseImageView;
@property (nonatomic, weak)UIImageView *progressImageView;
@property (nonatomic, assign)CGFloat progressValue;
@end
