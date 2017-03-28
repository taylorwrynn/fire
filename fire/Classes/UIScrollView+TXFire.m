/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIScrollView+TXFire.h"

@implementation UIScrollView (TXFire)

- (void)tx_scrollToTopWithAnimated:(BOOL)animated
{
    CGPoint offset = self.contentOffset;
    offset.y = -self.contentInset.top;
    [self setContentOffset:offset animated:animated];
}

- (void)tx_scrollToLeftWithAnimated:(BOOL)animated
{
    CGPoint offset = self.contentOffset;
    offset.x = -self.contentInset.left;
    [self setContentOffset:offset animated:animated];
}

- (CGFloat)tx_offsetOutsideOfTop
{
    return self.contentOffset.y + self.contentInset.top;
}

- (CGFloat)tx_offsetOutsideOfBottom
{
    return (self.contentSize.height - (self.bounds.size.height - self.contentInset.bottom)) - self.contentOffset.y;
}

@end
