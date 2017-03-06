/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSDate+TXFire.h"

@implementation NSDate (TXFire)

- (instancetype)tx_dateByAddingWeek:(NSUInteger)week
{
    return [self tx_dateByAddingDay:week * 7];
}

- (instancetype)tx_dateByAddingDay:(NSUInteger)day
{
    return [self tx_dateByAddingHour:day * 24];
}

- (instancetype)tx_dateByAddingHour:(NSUInteger)hour
{
    return [self tx_dateByAddingMinute:hour * 60];
}

- (instancetype)tx_dateByAddingMinute:(NSUInteger)min
{
    return [self dateByAddingTimeInterval:min * 60];
}

@end
