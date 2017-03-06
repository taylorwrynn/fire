/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#ifndef runtime_h
#define runtime_h

#ifndef ONE_PIXEL
#define ONE_PIXEL (1.f / UIScreen.mainScreen.scale)
#endif

#ifndef stringify_bool
#define stringify_bool(f) ((f) ? @"true" : @"false")
#endif

#ifndef is_main_thread
#define is_main_thread (NSThread.isMainThread || [NSOperationQueue currentQueue] == [NSOperationQueue mainQueue])
#endif

#ifndef is_empty_string
#define is_empty_string(x) ((x) == nil || (x) == [NSNull null] || ([(x) isKindOfClass:NSString.class] && [(x) length] == 0))
#endif

#ifndef string_equivalent
#define string_equivalent(s1, s2) (((s1) == nil && (s2) == nil) || ( ((s1) != nil) && ((s2) != nil) && [(s1) isEqualToString:(s2)]))
#endif

#define TXMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
userInfo:nil]

#define TXInitUnavailableDirectly(clz) \
NSAssert(![self isMemberOfClass:(clz)], @"%@ is an abstract class, you should not instantiate it directly.", NSStringFromClass(clz))

#endif /* runtime_h */
