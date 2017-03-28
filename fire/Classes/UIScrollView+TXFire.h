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

/// negative means scrolled outside top of content. 0 means just right visit the top of content. positive means scrolled down.
- (CGFloat)tx_offsetOutsideOfTop;
/// negative means scrolled outside bottom of content. 0 means just right visit bottom of content. positive means scrolled up.
- (CGFloat)tx_offsetOutsideOfBottom;

@end
