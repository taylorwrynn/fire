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

@interface NSString (TXFire)

- (nullable NSString *)tx_stringByDecodingURL;
- (nullable NSString *)tx_stringByEncodingURL;

- (BOOL)tx_isNumeric;

@end

NS_ASSUME_NONNULL_END
