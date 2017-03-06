/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UILabel+TXChainable.h"
#import "UIColor+TXFire.h"

@implementation UILabel (TXChainable)

- (__kindof UILabel *(^)(UIFont *))tx_font
{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (__kindof UILabel *(^)(CGFloat))tx_systemFont
{
    return ^(CGFloat size){
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}
- (__kindof UILabel *(^)(CGFloat))tx_boldSystemFont
{
    return ^(CGFloat size){
        self.font = [UIFont boldSystemFontOfSize:size];
        return self;
    };
}
- (__kindof UILabel *(^)(UIColor *))tx_textColor
{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (__kindof UILabel *(^)(NSUInteger))tx_textColorHex
{
    return ^(NSUInteger hex){
        self.textColor = [UIColor tx_colorWithHex:hex];
        return self;
    };
}

- (__kindof UILabel *(^)(NSString *))tx_text
{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (__kindof UILabel *(^)(NSTextAlignment))tx_textAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (__kindof UILabel *(^)(NSInteger))tx_numberOfLines
{
    return ^(NSInteger v){
        self.numberOfLines = v;
        return self;
    };
}

@end
