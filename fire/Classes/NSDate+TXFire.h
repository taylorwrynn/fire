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

@interface NSDate (TXFire)

- (instancetype)tx_dateByAddingWeek:(NSUInteger)week;
- (instancetype)tx_dateByAddingDay:(NSUInteger)day;

- (instancetype)tx_dateByAddingHour:(NSUInteger)hour;
- (instancetype)tx_dateByAddingMinute:(NSUInteger)min;

@end
