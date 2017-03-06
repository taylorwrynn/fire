/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSString+TXFire.h"
#import "NSRegularExpression+TXFire.h"

@implementation NSString (TXFire)

- (NSString *)tx_stringByDecodingURL
{
    return [self stringByRemovingPercentEncoding];
}

- (NSString *)tx_stringByEncodingURL
{
    NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
    
    [set formUnionWithCharacterSet:NSCharacterSet.URLUserAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLPasswordAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLHostAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLPathAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLQueryAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLFragmentAllowedCharacterSet];
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
}

- (BOOL)tx_isNumeric
{
    return TXRegexMatch(@"^\\d+$", self);
}

@end
