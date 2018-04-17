//
//  LayerThreadTester.h
//  testCALayer
//
//  Created by jft0m on 2018/4/17.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LayerThreadTester : NSObject
@property (nonatomic, strong) CALayer *layer;
- (void)startTest;
@end
