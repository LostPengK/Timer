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

@property(nonatomic,assign)NSInteger pastTime;

@end


@implementation BackgorundTimer

+(BackgorundTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo initWithBackgroundMode:(BOOL)yes{
    BackgorundTimer *this = [[BackgorundTimer alloc]init];
    this.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    this.background = yes;
    if(yes){
        [this addObserve];
    }
    return this;
}

+(BackgorundTimer *)initWithTimeInterval:(NSTimeInterval)ti startTime:(NSInteger)startTime targetTime:(NSInteger)targetTime timerType:(TimerType)type repeats:(BOOL)yesOrNo userInfo:(id)userInfo backgroundMode:(BOOL)yes{
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
    return this;
    
}

-(void)start{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(startCount) userInfo:self.userInfo repeats:self.repeat];
    [self.timer setFireDate:[NSDate distantPast]];
    [self.timer fire];
    
}

-(void)startCount{

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
    NSLog(@"enterBackground");
    [self pasue];
}


-(void)enterForeground:(NSNotification *)notice{
    NSLog(@"enterForeground");
    [self start];
}


@end
