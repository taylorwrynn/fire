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

@interface UIApplication (TXFire)

/**
 Get current app version.
 Convenient method for [[NSBundle mainBundle] tx_bundleVersion]
 */
- (NSString *)tx_appVersion;

/**
 Get current app display name.
 Convenient method for [[NSBundle mainBundle] tx_bundleDisplayName]
 */
- (NSString *)tx_appName;

/**
 Go to AppStore with the given app.
 
 @param appStoreId AppStore ID.
 */
- (void)tx_launchAppStoreForApp:(NSString *)appStoreId;


/**
 Use system mailto protocol to compose mail.
 */
- (void)tx_mailTo:(nullable NSString *)recipient subject:(nullable NSString *)subject messageBody:(nullable NSString *)messageBody fromViewController:(UIViewController *)viewController;

/**
 Dial to somebody
 
 @param number the phone number
 */
- (void)tx_telephoneTo:(NSString *)number;

@end

NS_ASSUME_NONNULL_END
