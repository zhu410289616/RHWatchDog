//
//  RHPingThread.m
//  RHWatchDog
//
//  Created by zhuruhong on 2017/4/22.
//  Copyright © 2017年 zhuruhong. All rights reserved.
//

#import "RHPingThread.h"

@interface RHPingThread ()

@property (nonatomic, assign) BOOL pingTaskIsRunning;

@end

@implementation RHPingThread

- (instancetype)init
{
    if (self = [super init]) {
        _threshold = 2000;//2000ms = 2s
    }
    return self;
}

- (void)main
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    unsigned int useconds = self.threshold * 1000;
    while (!self.isCancelled) {
        self.pingTaskIsRunning = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.pingTaskIsRunning = NO;
            dispatch_semaphore_signal(semaphore);
        });
        usleep(useconds);
        if (self.pingTaskIsRunning) {
            [self.delegate detectEvent];
        }
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
}

@end
