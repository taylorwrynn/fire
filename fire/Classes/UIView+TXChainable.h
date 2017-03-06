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

@interface UIView (TXChainable)

- (__kindof UIView *(^)(UIColor *))tx_backgroundColor;
- (__kindof UIView *(^)(NSUInteger))tx_backgroundColorHex;
- (__kindof UIView *(^)(UIViewContentMode))tx_contentMode;

/// [UIView layer]
- (__kindof UIView *(^)(CGFloat))tx_cornerRadius;
- (__kindof UIView *(^)(CGFloat))tx_borderWidth;
- (__kindof UIView *(^)(CGColorRef))tx_borderColor;

@end
