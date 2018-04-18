//
//  ViewController.m
//  testCALayer
//
//  Created by jft0m on 2018/4/17.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import "ViewController.h"
#import "LayerThreadTester.h"

const NSInteger kSum = 400;

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) LayerThreadTester *tester;
@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tester = [LayerThreadTester new];
    self.tester.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    self.tester.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tester.view];

    self.tester.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.tester.layer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    [self.view.layer addSublayer:self.tester.layer];
    
    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)update {
    if (self.count<kSum) {
        self.count++;
    } else {
        self.count = 0;
    }
    self.tester.view.frame = CGRectMake(0, 0, self.view.frame.size.width-self.count+1, self.view.frame.size.width-self.count+1);
    self.tester.layer.frame = CGRectMake(0, 0, self.view.frame.size.width-self.count-1, self.view.frame.size.width-self.count-1);
    [self.view layoutIfNeeded];
    [self.view.layer layoutIfNeeded];
}

- (IBAction)startTest:(UIButton *)sender {
    if (self.tester.isRunning) {
        [self.tester stopTest];
        [sender setTitle:@"开始测试" forState:UIControlStateNormal];
    } else {
        [self.tester startTest];
        [sender setTitle:@"停止测试" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
