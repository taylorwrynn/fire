/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIViewController+TXFire.h"
#import <objc/runtime.h>

@implementation UIViewController (TXFire)

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)),
                                   class_getInstanceMethod(self, @selector(tx_viewWillAppear:)));
}

- (void)tx_viewWillAppear:(BOOL)animated
{
    [self tx_viewWillAppear:animated];
    [self tx_setInteractiveNavigationBarHidden:self.tx_interactiveNavigationBarHidden animated:animated];
}

#pragma mark - interactive navigation bar hidden

static const void * kInteractiveNavigationBarHidden = &kInteractiveNavigationBarHidden;
- (void)setTx_interactiveNavigationBarHidden:(BOOL)hidden
{
    [self tx_setInteractiveNavigationBarHidden:hidden animated:NO];
}
- (BOOL)tx_interactiveNavigationBarHidden
{
    return [objc_getAssociatedObject(self, kInteractiveNavigationBarHidden) boolValue];
}

- (void)tx_setInteractiveNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    objc_setAssociatedObject(self, kInteractiveNavigationBarHidden, @(hidden), OBJC_ASSOCIATION_COPY);
    [self.navigationController setNavigationBarHidden:hidden animated:animated];
}

@end
