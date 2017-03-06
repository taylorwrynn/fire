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

@interface UILabel (TXChainable)

- (__kindof UILabel *(^)(UIFont * _Nullable))tx_font;
- (__kindof UILabel *(^)(CGFloat))tx_systemFont;
- (__kindof UILabel *(^)(CGFloat))tx_boldSystemFont;
- (__kindof UILabel *(^)(UIColor  * _Nullable ))tx_textColor;
- (__kindof UILabel *(^)(NSUInteger))tx_textColorHex;
- (__kindof UILabel *(^)(NSString * _Nullable))tx_text;
- (__kindof UILabel *(^)(NSTextAlignment))tx_textAlignment;

- (__kindof UILabel *(^)(NSInteger))tx_numberOfLines;

@end

NS_ASSUME_NONNULL_END
