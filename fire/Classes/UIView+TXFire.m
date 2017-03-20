/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIView+TXFire.h"
#import <objc/runtime.h>
#import "UIColor+TXFire.h"

@implementation UIView (TXFire)

#pragma mark - frame

- (CGFloat)tx_x
{
    return self.frame.origin.x;
}

- (void)setTx_x:(CGFloat)tx_x
{
    CGRect frame = self.frame;
    frame.origin.x = tx_x;
    self.frame = frame;
}

- (CGFloat)tx_y
{
    return self.frame.origin.y;
}

- (void)setTx_y:(CGFloat)tx_y
{
    CGRect frame = self.frame;
    frame.origin.y = tx_y;
    self.frame = frame;
}

- (CGPoint)tx_origin
{
    return self.frame.origin;
}

- (void)setTx_origin:(CGPoint)tx_origin
{
    CGRect frame = self.frame;
    frame.origin = tx_origin;
    self.frame = frame;
}

- (CGFloat)tx_width
{
    return self.bounds.size.width;
}

- (void)setTx_width:(CGFloat)tx_width
{
    CGRect frame = self.frame;
    frame.size.width = tx_width;
    self.frame = frame;
}

- (CGFloat)tx_height
{
    return self.bounds.size.height;
}

- (void)setTx_height:(CGFloat)tx_height
{
    CGRect frame = self.frame;
    frame.size.height = tx_height;
    self.frame = frame;
}

- (CGSize)tx_size
{
    return self.bounds.size;
}

- (void)setTx_size:(CGSize)tx_size
{
    CGRect frame = self.frame;
    frame.size = tx_size;
    self.frame = frame;
}

- (CGFloat)tx_maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)tx_maxY
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)tx_centerX
{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)tx_centerY
{
    return CGRectGetMidY(self.frame);
}

#pragma mark - Gesture Recognizer

- (UITapGestureRecognizer *)tx_tapGestureRecognizer
{
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, _cmd);
    if (tap) return tap;
    
    self.userInteractionEnabled = YES;
    tap = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, _cmd, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tap;
}

#pragma mark - View hierarchy

- (__kindof UIView *)tx_closestView:(BOOL (^)(__kindof UIView * _Nonnull))block
{
    UIView *view = self;
    while (view)
    {
        if (block(view))
        {
            return view;
        }
        view = view.superview;
    }
    return nil;
}

- (__kindof UIView *)tx_closestViewWithClass:(Class)cls
{
    return [self tx_closestView:^(UIView *view){
        return [view isKindOfClass:cls];
    }];
}

- (__kindof UIView *)tx_findView:(BOOL (^)(__kindof UIView * _Nonnull))filter
{
    UIView *view = self;
    if (filter(view))
    {
        return view;
    }
    for (UIView *subview in view.subviews)
    {
        return [subview tx_findView:filter];
    }
    return nil;
}

- (__kindof UIView *)tx_findViewWithClass:(Class)cls
{
    return [self tx_findView:^BOOL(__kindof UIView * _Nonnull view) {
        return [view isKindOfClass:cls];
    }];
}

- (void)tx_findView:(UIView *)view appendToArray:(NSMutableArray *)array filter:(BOOL (^)(__kindof UIView * _Nonnull))filter
{
    if (filter(view))
    {
        [array addObject:view];
        return;
    }
    for (UIView *subview in view.subviews)
    {
        [self tx_findView:subview appendToArray:array filter:filter];
    }
}

- (nullable NSArray<__kindof UIView *> *)tx_findViews:(BOOL(^)(__kindof UIView *view))filter
{
    NSMutableArray *results = [NSMutableArray array];
    [self tx_findView:self appendToArray:results filter:filter];
    if (results)
    {
        return results.copy;
    }
    return nil;
}

- (nullable NSArray<__kindof UIView *> *)tx_findViewsWithClass:(Class)cls
{
    return [self tx_findViews:^BOOL(__kindof UIView * _Nonnull view) {
        return [view isKindOfClass:cls];
    }];
}

- (void)tx_removeSubviews
{
    for (UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
}

@end
