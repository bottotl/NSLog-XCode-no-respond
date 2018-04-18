//
//  LayerThreadTester.m
//  testCALayer
//
//  Created by jft0m on 2018/4/17.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import "LayerThreadTester.h"

@interface LayerThreadTester()
@property (nonatomic) dispatch_queue_t queue;
@property (nonatomic) dispatch_block_t unsafeBlock;
@end

@implementation LayerThreadTester

- (instancetype)init {
    if (self = [super init]) {
        _queue = dispatch_queue_create("jft.test.thread", DISPATCH_QUEUE_SERIAL);
        _layer = [CALayer layer];
        _view  = [UIView new];
        _unsafeBlock = dispatch_block_create(0, ^{
            while (self.isRunning) {
                NSLog(@"1");
                CGRect layerFrame = self.layer.bounds;
//                NSLog(@"%@", [NSValue valueWithCGRect:layerFrame]);
//                CGRect viewFrame  = self.view.frame;
//                NSLog(@"%@", [NSValue valueWithCGRect:viewFrame]);
            }
        });
        _isRunning = NO;
    }
    return self;
}

- (void)startTest {
    self.isRunning = YES;
    dispatch_async(self.queue, self.unsafeBlock);
}

- (void)stopTest {
    self.isRunning = NO;
    dispatch_cancel(self.unsafeBlock);
}

@end
