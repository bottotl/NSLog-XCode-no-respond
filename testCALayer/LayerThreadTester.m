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
@end

@implementation LayerThreadTester

- (instancetype)init {
    if (self = [super init]) {
        _queue = dispatch_queue_create("jft.test.thread", DISPATCH_QUEUE_CONCURRENT);
        _layer = [CALayer layer];
    }
    return self;
}

- (void)startTest {
    dispatch_async(self.queue, ^{
        while (1) {
            NSLog(@"%@", @(self.layer.contentsScale));
        }
    });
}

@end
