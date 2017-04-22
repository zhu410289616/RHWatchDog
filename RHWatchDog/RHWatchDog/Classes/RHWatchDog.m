//
//  RHWatchDog.m
//  RHWatchDog
//
//  Created by zhuruhong on 2017/4/22.
//  Copyright © 2017年 zhuruhong. All rights reserved.
//

#import "RHWatchDog.h"
#import "RHPingThread.h"

@interface RHWatchDog () <RHPingThreadDelegate>
{
    RHWatchDogBlock _watchDogBlock;
    RHPingThread *_pingThread;
}

@end

@implementation RHWatchDog

- (void)dealloc
{
    [_pingThread cancel];
}

- (instancetype)init
{
    if (self = [super init]) {
        NSAssert(_pingThread, @"_pingThread is nil ...");
    }
    return self;
}

/** aThreshold：卡顿判断临界值 单位：秒s */
- (instancetype)initWithThreshold:(double)aThreshold block:(RHWatchDogBlock)aBlcok
{
    if (self = [super init]) {
        _watchDogBlock = [aBlcok copy];
        _pingThread = [[RHPingThread alloc] init];
        _pingThread.delegate = self;
        _pingThread.threshold = MAX(1000, aThreshold * 1000);
    }
    return self;
}

- (void)start
{
    [_pingThread start];
}

- (void)stop
{
    [_pingThread cancel];
}

#pragma mark - RHPingThreadDelegate

- (void)detectEvent
{
    if (_watchDogBlock) {
        _watchDogBlock();
    }
}

@end
