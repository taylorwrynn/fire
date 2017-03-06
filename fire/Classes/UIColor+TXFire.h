/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TXFire)

+ (UIColor *)tx_colorWithHex:(NSUInteger)hex;

/**
 UIColor with hex string, Optionally prefixed with '0x' or '0X'.
 @see [NSScanner scanHexLongLong:]

 @param hexString the hex string
 @return the color
 */
+ (UIColor *)tx_colorWithHexString:(NSString *)hexString;

- (NSUInteger)tx_hex;
- (NSString *)tx_hexString;

@end

NS_ASSUME_NONNULL_END
