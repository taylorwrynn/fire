/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSDictionary+TXFire.h"

@implementation NSDictionary (TXFire)

- (nullable id)tx_objectForKey:(NSString *)key expectedType:(Class)cls
{
    id value = self[key];
    
    return (value && value != [NSNull null] && [value isKindOfClass:cls]) ? value : nil;
}

- (NSString *)tx_stringForKey:(NSString *)key
{
    return [self tx_objectForKey:key expectedType:NSString.class];
}

- (NSNumber *)tx_numberForKey:(NSString *)key
{
    return [self tx_objectForKey:key expectedType:NSNumber.class];
}

- (NSDictionary *)tx_dictionaryForKey:(NSString *)key
{
    return [self tx_objectForKey:key expectedType:NSDictionary.class];
}

- (NSArray *)tx_arrayForKey:(NSString *)key
{
    return [self tx_objectForKey:key expectedType:NSArray.class];
}

- (BOOL)tx_boolForKey:(NSString *)key
{
    return [self tx_numberForKey:key].boolValue;
}

- (NSInteger)tx_integerForKey:(NSString *)key
{
    return [self tx_numberForKey:key].integerValue;
}

@end
