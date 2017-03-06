/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "AppDelegate.h"
#import "Classes/TXFire.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"Test";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
