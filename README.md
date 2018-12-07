# KVOTEST
目的
1.如何分析KVO原理
2.如何模拟实现系统级KVO
3.为什么要这么设计



KVO基本使用(LKVODemo1)
被监听对象 没有强引用 监听对象
需要注意 监听对象 的生命周期



KVO的触发模式(LKVODemo2)
自动触发模式(默认)
手动触发模式(重写被监听对象的automaticallyNotifiesObserversForKey:)
手动模式情况下在改变值之前调用 被监听对象 的willChangeValueForKey:方法,改变后调用 被监听对象的didChangeValueForKey:方法
手动模式下调用只关注will...和did...两个方法






