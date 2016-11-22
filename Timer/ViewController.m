//
//  ViewController.m
//  Timer
//
//  Created by pengkang on 2016/11/19.
//  Copyright © 2016年 pengkang. All rights reserved.
//

#import "ViewController.h"
#import "BackgorundTimer.h"


@interface ViewController (){

    NSInteger  time;
}

@property(nonatomic,weak) IBOutlet UILabel *showLa;

@property(nonatomic,weak) IBOutlet UILabel *showLa1;

@property(nonatomic,weak) IBOutlet UILabel *showLa2;

@property(nonatomic,strong)BackgorundTimer *timer;
@property(nonatomic,strong)BackgorundTimer *timer1;
@property(nonatomic,strong)BackgorundTimer *timer2;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self start];
}

-(IBAction)restart:(id)sender{
    [self.timer invidateTimer];
    [self.timer1 invidateTimer];
    [self.timer2 invidateTimer];
    [self start];
}

-(void)start{

    _timer = [BackgorundTimer initWithTimeInterval:1 startTime:0 targetTime:30 timerType:TimerTypeIncrese repeats:YES userInfo:nil backgroundMode:YES];
    _timer.targetTimeBlock = ^() {
        NSLog(@"add time finshed");
    };
    __weak typeof(self) weakSelf = self;
    _timer.excuteTimeBlock = ^(NSTimeInterval excuteTime){
        NSLog(@"excuteTime===%f",excuteTime);
        weakSelf.showLa.text = [NSString stringWithFormat:@"time is %.0f",excuteTime];
    };
    
//    _timer1 = [BackgorundTimer initWithTimeInterval:1 startTime:60 targetTime:40 timerType:TimerTypeDecrese repeats:YES userInfo:nil backgroundMode:YES];
//    _timer1.targetTimeBlock = ^() {
//        NSLog(@"count down finshed");
//    };
//    _timer1.excuteTimeBlock = ^(NSTimeInterval excuteTime){
//        weakSelf.showLa1.text = [NSString stringWithFormat:@"time is %.0f",excuteTime];
//    };
//    _timer2 = [BackgorundTimer initWithTimeInterval:0.02 startTime:100 targetTime:110 timerType:TimerTypeIncrese repeats:YES userInfo:nil backgroundMode:YES];
//    _timer2.targetTimeBlock = ^() {
//        NSLog(@"timer2 count down finshed");
//    };
//    _timer2.excuteTimeBlock = ^(NSTimeInterval excuteTime){
//        weakSelf.showLa2.text = [NSString stringWithFormat:@"time is %f",excuteTime];
//    };


}

-(void)count{
    
    time++;
    self.showLa.text = [NSString stringWithFormat:@"time is %ld",time];
    NSLog(@"self.showLa.text=%@",self.showLa.text);
}

-(void)add{
    
    NSLog(@"add");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
