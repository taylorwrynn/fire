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

@interface NSBundle (TXFire)

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleShortVersionString"]
 typically used in mainBundle
 */
- (nullable NSString *)tx_bundleVersion;

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleName"]
 typically used in mainBundle
 */
- (nullable NSString *)tx_bundleName;

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleDisplayName"]
 typically used in mainBundle
 */
- (nullable NSString *)tx_bundleDisplayName;

@end

NS_ASSUME_NONNULL_END
