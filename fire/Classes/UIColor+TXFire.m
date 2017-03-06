/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIColor+TXFire.h"

@implementation UIColor (TXFire)

+ (UIColor *)tx_colorWithHex:(NSUInteger)hex
{
    CGFloat red, green, blue, alpha;
    
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)tx_colorWithHexString:(NSString *)hexString
{
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned long long hex = 0;
    [scanner scanHexLongLong:&hex];
    return [self tx_colorWithHex:(NSUInteger)hex];
}

- (NSUInteger)tx_hex
{
    CGFloat red, green, blue, alpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
        [self getWhite:&red alpha:&alpha];
        green = red;
        blue = red;
    }
    
    red = roundf(red * 255.f);
    green = roundf(green * 255.f);
    blue = roundf(blue * 255.f);
    alpha = roundf(alpha * 255.f);
    
    return (NSUInteger)((uint)alpha << 24) | ((uint)red << 16) | ((uint)green << 8) | ((uint)blue);
}

- (NSString *)tx_hexString
{
    return [NSString stringWithFormat:@"0x%08x", (uint)[self tx_hex]];
}

@end
