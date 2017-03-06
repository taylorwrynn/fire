/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RACSignal;

@interface NSObject (TXFire)

- (RACSignal *)tx_valuesForKeyPath:(NSString *)keyPath;
- (RACSignal *)tx_valuesForKeyPaths:(NSArray<NSString *> *)keypaths;

@end

NS_ASSUME_NONNULL_END
