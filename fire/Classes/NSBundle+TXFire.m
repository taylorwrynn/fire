/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSBundle+TXFire.h"

@implementation NSBundle (TXFire)

- (nullable NSString *)tx_bundleVersion
{
    return [self objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (nullable NSString *)tx_bundleName
{
    return [self objectForInfoDictionaryKey:@"CFBundleName"];
}

- (nullable NSString *)tx_bundleDisplayName
{
    return [self objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

@end
