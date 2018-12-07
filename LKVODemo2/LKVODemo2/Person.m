
//
//  Person.m
//  LKVODemo1
//
//  Created by HoTia on 2018/12/5.
//  Copyright © 2018 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "Person.h"

@implementation Person
// 模式调整
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    return NO;
//}

+ (BOOL)automaticallyNotifiesObserversOfName {
    return NO;
}

@end
