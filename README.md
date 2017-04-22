# RHWatchDog
iOS卡顿监控
<br/>

---
## From Swift
https://github.com/wojteklu/Watchdog
<br/>

---
## Usage

```Oblect-C
_watchDog = [[RHWatchDog alloc] initWithThreshold:0.4 block:^{
        NSLog(@"RHWatchDog ...");
    }];
    [_watchDog start];
```
<br/>

---
### [CocoaPods]

```ruby
pod 'RHWatchdog'
```
