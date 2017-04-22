//
//  RHWatchDog.h
//  RHWatchDog
//
//  Created by zhuruhong on 2017/4/22.
//  Copyright © 2017年 zhuruhong. All rights reserved.
//
//  swift: https://github.com/wojteklu/Watchdog

#import <Foundation/Foundation.h>

typedef void(^RHWatchDogBlock)(void);

@interface RHWatchDog : NSObject

- (instancetype)init NS_UNAVAILABLE;
/** aThreshold：卡顿判断临界值 单位：秒s */
- (instancetype)initWithThreshold:(double)aThreshold block:(RHWatchDogBlock)aBlcok;
- (void)start;
- (void)stop;

@end
