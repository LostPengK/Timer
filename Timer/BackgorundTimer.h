//
//  BackgorundTimer.h
//  Timer
//
//  Created by pengkang on 2016/11/19.
//  Copyright © 2016年 pengkang. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TimerTypeIncrese = 0,
    TimerTypeDecrese,
} TimerType;


NS_ASSUME_NONNULL_BEGIN
@interface BackgorundTimer : NSObject

+(BackgorundTimer *)initWithTimeInterval:(NSTimeInterval)ti startTime:(NSTimeInterval)startTime targetTime:(NSTimeInterval)targetTime timerType:(TimerType)type repeats:(BOOL)yesOrNo userInfo:(nullable id)userInfo backgroundMode:(BOOL)yes;

-(void)start;
-(void)pasue;
-(void)invidateTimer;

@property(nonatomic,assign)NSTimeInterval time;

@property(nonatomic,assign)TimerType increseType;

// seconds
@property(nonatomic,assign)NSTimeInterval duration;
//when time reaches the targettime ,stop timer  if needed.
@property(nonatomic,assign)NSTimeInterval targetTime;

@property(nonatomic,strong)NSDictionary *userInfo;

@property(nonatomic,copy)void(^targetTimeBlock)();

@property(nonatomic,copy)void(^excuteTimeBlock)(NSTimeInterval excuteTime);

@end
NS_ASSUME_NONNULL_END
