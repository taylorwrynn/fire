/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "NSURL+TXFire.h"
#import "runtime.h"

@implementation NSURL (TXFire)

- (nullable NSString *)tx_URLStringByRemovingFragment
{
    if (self.fragment)
    {
        return [self.absoluteString stringByReplacingOccurrencesOfString:[@"#" stringByAppendingString:self.fragment]
                                                              withString:@""];
    }
    return self.absoluteString;
}

- (BOOL)tx_isScheme:(NSString *)scheme
{
    return self.scheme && [self.scheme caseInsensitiveCompare:scheme] == NSOrderedSame;
}

- (BOOL)tx_isHTTP
{
    return [self tx_isScheme:@"http"];
}

- (BOOL)tx_isHTTPS
{
    return [self tx_isScheme:@"https"];
}

- (BOOL)tx_isTEL
{
    return [self tx_isScheme:@"tel"];
}

- (BOOL)tx_isHTTPOrHTTPS
{
    return [self tx_isHTTP] || [self tx_isHTTPS];
}

- (BOOL)tx_isMAILTO
{
    return [self tx_isScheme:@"mailto"];
}

- (BOOL)tx_isItunes
{
    return self.host && [self.host caseInsensitiveCompare:@"itunes.apple.com"] == NSOrderedSame;
}

- (BOOL)tx_isFragmentJumpWith:(NSURL *)URL
{
    if (string_equivalent(self.absoluteString, URL.absoluteString))
    {
        return NO;
    }
    
    NSString *toURLString = [self tx_URLStringByRemovingFragment];
    NSString *fromURLString = [URL tx_URLStringByRemovingFragment];
    return string_equivalent(toURLString, fromURLString);
}


@end
