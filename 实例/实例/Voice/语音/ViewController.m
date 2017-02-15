//
//  ViewController.m
//  语音
//
//  Created by 胡碧涛 on 2016/12/29.
//  Copyright © 2016年 hubitao.com.study. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface ViewController ()<AVSpeechSynthesizerDelegate>
@property (nonatomic, strong)AVSpeechSynthesizer *av;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame=CGRectMake(100,100,100,50);
    
    [button setTitle:@"讲"forState:UIControlStateNormal];
    
    [button setTitle:@"停"forState:UIControlStateSelected];
    
    [button setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
    
    button.backgroundColor=[UIColor grayColor];
    
    button.showsTouchWhenHighlighted=YES;
    
    [button addTarget:self action:@selector(start:)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

-(void)start:(UIButton*)sender{
    
    if(sender.selected==NO) {
        
        if([self.av isPaused]) {
            
            //如果暂停则恢复，会从暂停的地方继续
            
            [self.av continueSpeaking];
            
            sender.selected=!sender.selected;
            
        }else{
            
            //初始化对象
            
            AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
            self.av = av;
            self.av.delegate = self;//挂上代理
            
            AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:@"锦瑟无端五十弦，一弦一柱思华年。庄生晓梦迷蝴蝶，望帝春心托杜鹃。沧海月明珠有泪，蓝田日暖玉生烟。此情可待成追忆，只是当时已惘然。"];//需要转换的文字
            
            utterance.rate = 0.5;// 设置语速，范围0-1，注意0最慢，1最快；AVSpeechUtteranceMinimumSpeechRate最慢，AVSpeechUtteranceMaximumSpeechRate最快
            
            AVSpeechSynthesisVoice * voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置发音，这是中文普通话
            
            utterance.voice= voice;
            
            [av speakUtterance:utterance];//开始
            
            sender.selected=!sender.selected;
            
        }
        
    }else{
        
        //[av stopSpeakingAtBoundary:AVSpeechBoundaryWord];//感觉效果一样，对应代理>>>取消
        
        [self.av pauseSpeakingAtBoundary:AVSpeechBoundaryWord];//暂停
        
        sender.selected=!sender.selected;
        
    }
    
    //[utterance release];//需要关闭ARC
    
    //[av release];
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didStartSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---开始播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---完成播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---播放中止");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---恢复播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---播放取消");
    
}

@end
