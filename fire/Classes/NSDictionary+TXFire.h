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

@interface NSDictionary (TXFire)

- (nullable NSString *)tx_stringForKey:(NSString *)key;
- (nullable NSNumber *)tx_numberForKey:(NSString *)key;
- (NSInteger)tx_integerForKey:(NSString *)key;
- (BOOL)tx_boolForKey:(NSString *)key;
- (nullable NSDictionary *)tx_dictionaryForKey:(NSString *)key;
- (nullable NSArray *)tx_arrayForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
