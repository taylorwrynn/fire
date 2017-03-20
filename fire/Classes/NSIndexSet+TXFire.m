/**
 *
 * Fire https://github.com/taylorwrynn/Fire
 *
 * Copyright (C) 2017 Taylor Tang
 * 
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSIndexSet+TXFire.h"

@implementation NSIndexSet (TXFire)

- (NSArray<NSNumber *> *)tx_toArray
{
    NSInteger index = self.firstIndex;
    NSMutableArray *results = [NSMutableArray array];
    while (index != NSNotFound)
    {
        [results addObject:@(index)];
        index = [self indexGreaterThanIndex:index];
    }
    return results.copy;
}

- (NSArray<NSNumber *> *)tx_toDescendingArray
{
    NSInteger index = self.lastIndex;
    NSMutableArray *results = [NSMutableArray array];
    while (index != NSNotFound)
    {
        [results addObject:@(index)];
        index = [self indexLessThanIndex:index];
    }
    return results.copy;
}

@end
