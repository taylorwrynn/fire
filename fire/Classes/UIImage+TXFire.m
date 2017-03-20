/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIImage+TXFire.h"
#import <ImageIO/ImageIO.h>
#import <ReactiveObjC/ReactiveObjC.h>

static void tx_CGContextFill(CGContextRef context, UIColor *color, CGRect rect, BOOL ellipse)
{
    [color setFill];
    if (ellipse)
    {
        CGContextAddEllipseInRect(context, rect);
    }
    else
    {
        CGContextAddRect(context, rect);
    }
    
    CGContextFillPath(context);
}

@implementation UIImage (TXFire)

- (UIImage *)tx_centerResizingImage
{
    CGSize size = self.size;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(floor(size.height / 2.f),
                                           floor(size.width / 2.f),
                                           floor(size.height / 2.f),
                                           floor(size.width / 2.f));
    return [self resizableImageWithCapInsets:insets];
}

- (CGSize)tx_sizeThatFitWidth:(CGFloat)width
{
    CGSize size = self.size;
    return CGSizeMake(width, floor(width / size.width) * size.height);
}

+ (UIImage *)tx_imageWithColor:(UIColor *)color size:(CGSize)size ellipse:(BOOL)ellipse
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    tx_CGContextFill(context, color, CGRectMake(0, 0, size.width, size.height), ellipse);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)tx_imageWithColor:(UIColor *)color
{
    return [self tx_imageWithColor:color size:CGSizeMake(1.f, 1.f) ellipse:NO];
}

@end
