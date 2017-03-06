/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIView+TXChainable.h"
#import "UIColor+TXFire.h"

@implementation UIView (TXChainable)

- (__kindof UIView *(^)(UIColor *))tx_backgroundColor
{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (__kindof UIView *(^)(NSUInteger))tx_backgroundColorHex
{
    return ^(NSUInteger hex){
        self.backgroundColor = [UIColor tx_colorWithHex:hex];
        return self;
    };
}

- (__kindof UIView *(^)(UIViewContentMode))tx_contentMode
{
    return ^(UIViewContentMode mode){
        self.contentMode = mode;
        return self;
    };
}

- (__kindof UIView *(^)(CGFloat))tx_cornerRadius
{
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        return self;
    };
}

- (__kindof UIView *(^)(CGFloat))tx_borderWidth
{
    return ^(CGFloat value){
        self.layer.borderWidth = value;
        return self;
    };
}

- (__kindof UIView *(^)(CGColorRef))tx_borderColor
{
    return ^(CGColorRef value){
        self.layer.borderColor = value;
        return self;
    };
}

@end
