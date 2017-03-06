/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSArray+TXFire.h"

@implementation NSArray (TXFire)

- (NSArray *)tx_filter:(BOOL (^)(id _Nonnull))filter
{
    return [self tx_filterWithIndex:^(id object, NSUInteger idx){
        return filter(object);
    }];
}

- (NSArray *)tx_filterWithIndex:(BOOL(^)(id, NSUInteger))filter
{
    if (self.count == 0) return @[];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop){
        if (filter(object, idx)) [array addObject:object];
    }];
    return array.copy;
}

- (NSArray *)tx_map:(id  _Nonnull (^)(id _Nonnull))map
{
    if (self.count == 0) return @[];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self)
    {
        [array addObject:map(obj)];
    }
    return array.copy;
}

- (id)tx_findObject:(BOOL (^)(id _Nonnull))find
{
    NSUInteger index = [self tx_findIndex:find];
    if (index != NSNotFound)
    {
        return self[index];
    }
    return nil;
}

- (BOOL)tx_find:(BOOL (^)(id _Nonnull))find
{
    return [self tx_findIndex:find] != NSNotFound;
}

- (NSUInteger)tx_findIndex:(BOOL (^)(id _Nonnull))find
{
    __block NSUInteger result = NSNotFound;
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop){
        if (find(object))
        {
            result = index;
            *stop = YES;
        }
    }];
    return result;
}

@end
