/**
 *
 * Fire https://github.com/taylorwrynn/Fire
 *
 * Copyright (C) 2017 Taylor Tang
 * 
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import <Foundation/Foundation.h>

@interface NSIndexSet (TXFire)

/// order is ascending.
- (NSArray<NSNumber *> *)tx_toArray;
- (NSArray<NSNumber *> *)tx_toDescendingArray;

@end
