/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSObject+TXFire.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "NSArray+TXFire.h"

@implementation NSObject (TXFire)

- (RACSignal *)tx_valuesForKeyPath:(NSString *)keyPath
{
    __weak id object = self;
    return [object rac_valuesForKeyPath:keyPath observer:self];
}

- (RACSignal *)tx_valuesForKeyPaths:(NSArray<NSString *> *)keypaths
{
    NSCAssert(keypaths.count > 0, @"keypaths count not be empty");
    
    return [RACSignal merge:[keypaths tx_map:^(NSString *keypath){
        return [self tx_valuesForKeyPath:keypath];
    }]];
}

@end
