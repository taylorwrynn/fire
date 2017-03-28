/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIImage+TXGIF.h"
#import "NSArray+TXFire.h"
#import <ReactiveObjC/ReactiveObjC.h>

static inline CGImageSourceRef CreateImageSourceWithFile(NSString *path)
{
    CFDataRef data = (__bridge CFDataRef)[NSData dataWithContentsOfFile:path];
    if (data == NULL)
    {
        return NULL;
    }
    return CGImageSourceCreateWithData(data, nil);
}

static inline __unused  CFArrayRef CreateImagesWithSourceAndCount(CGImageSourceRef const source, size_t const count)
{
    CFMutableArrayRef results = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
    
    for (size_t i = 0; i < count; i++)
    {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, nil);
        CFArrayAppendValue(results, image);
        CGImageRelease(image);
    }
    
    return results;
}

static inline float ImageSourceGetTotalDuration(CGImageSourceRef const source, size_t const count)
{
    float duration = 0.f;
    
    for (int i = 0; i < count; i++)
    {
        CFDictionaryRef const properties = CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        if (!properties)
        {
            continue;
        }
        
        CFDictionaryRef const gifProperties = CFDictionaryGetValue(properties, kCGImagePropertyGIFDictionary);
        if (gifProperties)
        {
            NSNumber *number =  (__bridge id)CFDictionaryGetValue(gifProperties, kCGImagePropertyGIFUnclampedDelayTime);
            if (number == NULL || [number doubleValue] == 0)
            {
                number =  (__bridge id)CFDictionaryGetValue(gifProperties, kCGImagePropertyGIFDelayTime);
            }
            if ([number doubleValue] > 0)
            {
                // Even though the GIF stores the delay as an integer number of centiseconds, ImageIO “helpfully” converts that to seconds for us.
                duration += number.floatValue;
            }
        }
        CFRelease(properties);
    }
    
    return duration;
}

@implementation UIImage (TXGIF)

+ (CFArrayRef)tx_gifFramesWithFile:(NSString *)path totalDuration:(out NSTimeInterval *)ti
{
    CGImageSourceRef isrc = CreateImageSourceWithFile(path);
    if (!isrc)
    {
        return NULL;
    }
    @onExit {
        CFRelease(isrc);
    };
    size_t const count = CGImageSourceGetCount(isrc);
    if (count == 0)
    {
        return NULL;
    }
    CFMutableArrayRef frames = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
    for (size_t index = 0; index < count; index++)
    {
        CGImageRef image = CGImageSourceCreateImageAtIndex(isrc, index, NULL);
        CFArrayAppendValue(frames, image);
        CFRelease(image);
    }
    if (ti)
    {
        NSTimeInterval totalDuration = ImageSourceGetTotalDuration(isrc, count);
        *ti = totalDuration;
    }
    return CFAutorelease(frames);
}

+ (NSArray<UIImage *> *)tx_gifImagesWithFile:(NSString *)path totalDuration:(out NSTimeInterval *)ti
{
    CFArrayRef frames = [self tx_gifFramesWithFile:path totalDuration:ti];
    if (!frames)
    {
        return NULL;
    }
    CFIndex count = CFArrayGetCount(frames);
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:count];
    for (CFIndex idx = 0; idx < count; idx++)
    {
        CGImageRef frame = (CGImageRef)CFArrayGetValueAtIndex(frames, idx);
        [results addObject:[UIImage imageWithCGImage:frame scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
    }
    return results;
}

+ (UIImage *)tx_gifAnimatedImageWithFile:(NSString *)path
{
    NSTimeInterval duration = 0;
    NSArray *images = [self tx_gifImagesWithFile:path totalDuration:&duration];
    if (images)
    {
        return [UIImage animatedImageWithImages:images duration:duration];
    }
    return nil;
}

@end
