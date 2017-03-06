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

@interface UIViewController (TXFire)

/// Only hides navigation bar for this view controller.
@property (nonatomic, assign) BOOL tx_interactiveNavigationBarHidden;
- (void)tx_setInteractiveNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
