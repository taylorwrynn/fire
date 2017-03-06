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

typedef NS_OPTIONS(NSInteger, TXViewPosition) {
    TXViewPositionNone = 0,
    TXViewPositionTop = 1 << 0,
    TXViewPositionLeft = 1 << 1,
    TXViewPositionBottom = 1 << 2,
    TXViewPositionRight = 1 << 3,
    TXViewPositionAny = TXViewPositionTop | TXViewPositionLeft | TXViewPositionBottom | TXViewPositionRight,
};


@interface UIView (TXFire)

@property (nonatomic, assign) CGFloat tx_x; // manipulates frame
@property (nonatomic, assign) CGFloat tx_y; // manipulates frame
@property (nonatomic, assign) CGPoint tx_origin; // manipulates frame

@property (nonatomic, assign) CGFloat tx_width; // get from bounds, but set to frame
@property (nonatomic, assign) CGFloat tx_height; // get from bounds, but set to frame
@property (nonatomic, assign) CGSize tx_size; // // get from bounds, but set to frame

@property (nonatomic, assign, readonly) CGFloat tx_maxX; // get from frame
@property (nonatomic, assign, readonly) CGFloat tx_maxY; // get from frame
@property (nonatomic, assign, readonly) CGFloat tx_centerX;
@property (nonatomic, assign, readonly) CGFloat tx_centerY;


/**
 If not exists, A new UITapGestureRecognizer will be created and added to the sender, then set userInteractionEnabled to YES.
 otherwise return it directly.
 */
@property (nonatomic, strong, readonly) UITapGestureRecognizer *tx_tapGestureRecognizer;


/**
 Searches through sender and it's ancestors in the view hierarchy, return the closest satisfied one.

 @param block determines the view which is satisfied
 @return the closest satisfied view
 */
- (nullable __kindof UIView *)tx_closestView:(BOOL(^)(__kindof UIView *view))block;

/**
 Searches through sender and it's ancestors in the view hierarchy, return the closest one for specified type.
 
 @see [UIView tx_closestView:]

 @param cls the class of expected view.
 @return the closest satisfied view
 */
- (nullable __kindof UIView *)tx_closestViewWithClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
