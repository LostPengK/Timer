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

@property(nonatomic,strong)BackgorundTimer *timer;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _timer =  [BackgorundTimer timerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES initWithBackgroundMode:YES ];
     
    
//    _timer = [BackgorundTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer");
//    }];
//    
//    [_timer fire];
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
