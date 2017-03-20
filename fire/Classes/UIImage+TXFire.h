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

@interface UIImage (TXFire)

/// @see [UIImage resizableImageWithCapInsets:]
- (UIImage *)tx_centerResizingImage;


/**
 Image Generator

 @param color     the color to fill
 @param size      canvas size
 @param ellipse   denotes a ellipse will be drawed in specified size
 @return          the image 
 */
+ (UIImage *)tx_imageWithColor:(UIColor *)color size:(CGSize)size ellipse:(BOOL)ellipse;
+ (UIImage *)tx_imageWithColor:(UIColor *)color; // (1, 1) pure color image. not ellipse.

@end

NS_ASSUME_NONNULL_END
