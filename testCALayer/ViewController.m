//
//  ViewController.m
//  testCALayer
//
//  Created by jft0m on 2018/4/17.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import "ViewController.h"
#import "LayerThreadTester.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LayerThreadTester *tester = [LayerThreadTester new];
    [self.view.layer addSublayer:tester.layer];
    tester.layer.backgroundColor = [UIColor blueColor].CGColor;
    tester.layer.frame = self.view.layer.bounds;
    [tester startTest];
    
    const NSInteger sum = 400;
    __block NSInteger count = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (count<sum) {
            count++;
        } else {
            count = 0;
        }
        tester.layer.frame = CGRectMake(0, 0, self.view.frame.size.width-count, self.view.frame.size.width-count);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
