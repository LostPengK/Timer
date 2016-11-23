//
//  BackgorundTimer.m
//  Timer
//
//  Created by pengkang on 2016/11/19.
//  Copyright © 2016年 pengkang. All rights reserved.
//

#import "BackgorundTimer.h"
#import <UIKit/UIKit.h>
@interface BackgorundTimer(){

}

@property(nonatomic,assign)BOOL background;

@property(nonatomic,assign)BOOL repeat;

@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,assign)NSTimeInterval enterBackgroundTime;

@end


@implementation BackgorundTimer

+(BackgorundTimer *)initWithTimeInterval:(NSTimeInterval)ti startTime:(NSTimeInterval)startTime targetTime:(NSTimeInterval)targetTime timerType:(TimerType)type repeats:(BOOL)yesOrNo userInfo:(id)userInfo backgroundMode:(BOOL)yes{
    BackgorundTimer *this = [[BackgorundTimer alloc]init];
    this.increseType = type;
    this.duration = ti;
    this.time = startTime;
    this.targetTime = targetTime;
    this.background = yes;
    this.repeat = yesOrNo;
    if(yes){
        [this addObserve];
    }
    this.timer = [NSTimer scheduledTimerWithTimeInterval:this.duration target:this selector:@selector(startCount) userInfo:this.userInfo repeats:this.repeat];
    [[NSRunLoop currentRunLoop]addTimer:this.timer forMode:NSRunLoopCommonModes];
    [this.timer fire];
    return this;
    
}

-(void)start{
    [self.timer setFireDate:[NSDate distantPast]];
}

-(void)startCount{
    if (self.excuteTimeBlock) {
        self.excuteTimeBlock(self.time);
    }
    if (self.increseType==TimerTypeIncrese) {
        self.time += self.duration;
        if (self.time>=self.targetTime) {
            [self invidateTimer];
            if (self.targetTimeBlock) {
                self.targetTimeBlock();
            }
        }
    }else{
        self.time -= self.duration;
        if (self.time <= self.targetTime) {
            [self invidateTimer];
            if (self.targetTimeBlock) {
                self.targetTimeBlock();
            }
        }
    }
}

-(void)pasue{
    [self.timer setFireDate:[NSDate distantFuture]];
}

-(void)invidateTimer{
    [self.timer invalidate];
}

-(void)addObserve{
    if (!self.background) {
        return;
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
}

-(void)removeObserve{
    if (!self.background) {
        return;
    }
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}

-(void)enterBackground:(NSNotification *)notice{
    self.enterBackgroundTime = [[NSDate date] timeIntervalSince1970];
    [self pasue];
}


-(void)enterForeground:(NSNotification *)notice{
    NSTimeInterval newIn = [[NSDate date]timeIntervalSince1970];
    if (self.increseType==TimerTypeIncrese) {
        self.time += newIn - self.enterBackgroundTime;
    }else{
        self.time -= newIn - self.enterBackgroundTime;
    }
    
    [self start];
}


@end
