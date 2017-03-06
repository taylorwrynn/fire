/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (TXFire)

- (NSArray<ObjectType> *)tx_filter:(BOOL(^)(ObjectType object))filter;
- (NSArray<ObjectType> *)tx_filterWithIndex:(BOOL(^)(ObjectType object, NSUInteger index))filter;

- (NSArray *)tx_map:(id(^)(ObjectType object))map;

- (nullable ObjectType)tx_findObject:(BOOL(^)(ObjectType object))find;
- (BOOL)tx_find:(BOOL(^)(ObjectType object))find;
- (NSUInteger)tx_findIndex:(BOOL(^)(ObjectType object))find;

@end

NS_ASSUME_NONNULL_END

