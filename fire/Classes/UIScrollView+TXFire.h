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
#import "UIView+TXFire.h"

@interface UIScrollView (TXFire)

- (void)tx_scrollToTopWithAnimated:(BOOL)animated;
- (void)tx_scrollToLeftWithAnimated:(BOOL)animated;

@end
