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

@interface NSURL (TXFire)

- (BOOL)tx_isHTTP;
- (BOOL)tx_isHTTPS;
- (BOOL)tx_isHTTPOrHTTPS;
- (BOOL)tx_isTEL;
- (BOOL)tx_isMAILTO;

- (BOOL)tx_isItunes;

- (BOOL)tx_isFragmentJumpWith:(NSURL *)URL;

@end
