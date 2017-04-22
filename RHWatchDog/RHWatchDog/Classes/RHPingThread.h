//
//  RHPingThread.h
//  RHWatchDog
//
//  Created by zhuruhong on 2017/4/22.
//  Copyright © 2017年 zhuruhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RHPingThreadDelegate <NSObject>

@required

- (void)detectEvent;

@end

@interface RHPingThread : NSThread

/** 卡顿判断临界值 单位：毫秒ms */
@property (nonatomic, assign) unsigned int threshold;
@property (nonatomic, weak) id<RHPingThreadDelegate> delegate;

@end
