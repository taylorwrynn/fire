/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIApplication+TXFire.h"
#import "NSBundle+TXFire.h"
#import <MessageUI/MessageUI.h>
#import <objc/runtime.h>
#import "NSString+TXFire.h"

static NSString *const kLaunchAppStoreLink = @"https://itunes.apple.com/app/apple-store/id%@?mt=8";

@implementation UIApplication (TXFire)

- (NSString *)tx_appVersion
{
    return [[NSBundle mainBundle] tx_bundleVersion];
}

- (NSString *)tx_appName
{
    return [[NSBundle mainBundle] tx_bundleDisplayName];
}

- (void)tx_openURLString:(NSString *)URLString
{
    NSURL *URL = [NSURL URLWithString:URLString];
    
    if (!URL) return;
    
    if ([self canOpenURL:URL])
    {
        if ([self respondsToSelector:@selector(openURL:options:completionHandler:)])
        {
            [self openURL:URL options:@{} completionHandler:NULL];
        }
        else
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
            [self openURL:URL];
#pragma clang diagnostic pop
        }
    }
}

- (void)tx_launchAppStoreForApp:(NSString *)appStoreId
{
    NSString *link = [NSString stringWithFormat:kLaunchAppStoreLink, appStoreId];
    [self tx_openURLString:link];
}

- (void)tx_telephoneTo:(NSString *)number
{
    [self tx_openURLString:[@"tel://" stringByAppendingString:number]];
}

#pragma mark - send email

static void tx_mailComposeControllerDidFinish(id self, SEL _cmd, MFMailComposeViewController *composeController, MFMailComposeResult result, NSError *error)
{
    [composeController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)tx_mailTo:(NSString *)recipient subject:(NSString *)subject messageBody:(NSString *)messageBody fromViewController:(UIViewController *)viewController
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
        [mailComposeViewController setSubject:subject ?: @""];
        [mailComposeViewController setToRecipients:recipient ? @[recipient] : nil];
        [mailComposeViewController setMessageBody:messageBody ?: @"" isHTML:NO];
        [viewController presentViewController:mailComposeViewController animated:YES completion:NULL];
        
        // extends MFMailComposeViewController(Create subclass) to receive delegate messages.
        static const char *name = "TX_MFMailComposeViewController";
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class newClass = objc_allocateClassPair([MFMailComposeViewController class], name, 0);
            class_addProtocol(newClass, @protocol(MFMailComposeViewControllerDelegate));
            SEL sel = @selector(mailComposeController:didFinishWithResult:error:);
            const char * typeEncoding = [[NSString stringWithFormat:@"v@:@%s@", @encode(MFMailComposeResult)] UTF8String];
            class_addMethod(newClass, sel, (IMP)tx_mailComposeControllerDidFinish, typeEncoding);
            objc_registerClassPair(newClass);
        });
        object_setClass(mailComposeViewController, objc_getClass(name));
        mailComposeViewController.mailComposeDelegate = (id<MFMailComposeViewControllerDelegate>)mailComposeViewController;
    }
    else
    {
        NSMutableString *mail = [NSMutableString stringWithString:@"mailto:"];
        if (recipient)
        {
            [mail appendString:[recipient tx_stringByEncodingURL]];
        }
        [mail appendString:@"?"];
        NSMutableArray *params = [NSMutableArray array];
        if (subject)
        {
            [params addObject:[NSString stringWithFormat:@"subject=%@", [subject tx_stringByEncodingURL]]];
        }
        if (messageBody)
        {
            [params addObject:[NSString stringWithFormat:@"body=%@", [messageBody tx_stringByEncodingURL]]];
        }
        if (params.count > 0)
        {
            [mail appendString:[params componentsJoinedByString:@"&"]];
        }
        
        [self tx_openURLString:mail];
    }
}

@end
