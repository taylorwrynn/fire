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
#import <ImageIO/ImageIO.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TXGIF)

+ (nullable UIImage *)tx_gifAnimatedImageWithFile:(NSString *)path;

/// CGImageRef
+ (nullable CFArrayRef)tx_gifFramesWithFile:(NSString *)path totalDuration:(out NSTimeInterval *)ti;
+ (nullable NSArray<UIImage *> *)tx_gifImagesWithFile:(NSString *)path totalDuration:(out NSTimeInterval *)ti;

@end

NS_ASSUME_NONNULL_END
