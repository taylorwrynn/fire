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

#ifndef TXRegex
#define TXRegex(x) [NSRegularExpression tx_regularExpressionWithPattern:x]
#endif

#ifndef TXRegexMatch
#define TXRegexMatch(pattern, string) [TXRegex(pattern) tx_match:(string)]
#endif

@interface NSRegularExpression (TXFire)

/// option is case insensitive
+ (nullable instancetype)tx_regularExpressionWithPattern:(NSString *)pattern;
+ (nullable instancetype)tx_regularExpressionWithPattern:(NSString *)pattern caseInsensitive:(BOOL)caseInsensitive;

- (BOOL)tx_match:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
