/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSRegularExpression+TXFire.h"

@implementation NSRegularExpression (TXFire)

+ (instancetype)tx_regularExpressionWithPattern:(NSString *)pattern
{
    return [self tx_regularExpressionWithPattern:pattern caseInsensitive:YES];
}

+ (instancetype)tx_regularExpressionWithPattern:(NSString *)pattern caseInsensitive:(BOOL)caseInsensitive
{
    return [self regularExpressionWithPattern:pattern options:caseInsensitive ? NSRegularExpressionCaseInsensitive : 0 error:NULL];
}

- (BOOL)tx_match:(NSString *)string
{
    return [self firstMatchInString:string options:0 range:NSMakeRange(0, string.length)] != nil;
}

@end
