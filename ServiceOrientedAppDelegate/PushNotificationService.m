//
//  PushNotificationService.m
//  ServiceOrientedAppDelegate
//
//  Created by Nico Hämäläinen on 09/02/14.
//  Copyright (c) 2014 Nico Hämäläinen. All rights reserved.
//

#import "PushNotificationService.h"

@implementation PushNotificationService

// Singleton initializer
+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t _onceToken;
    dispatch_once(&_onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

// Tap into the application launch sequence and register for remote
// notifications.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Register for remote notifications
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeSound |
     UIRemoteNotificationTypeAlert];

    // If we launched from a remote notification, we'll pass the handler
    // to the notification handler method.
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        [self application:application didReceiveRemoteNotification:launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]];
    }

    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // This method is called when the device successfully registers with the Apple Push Service
    NSLog(@"PushNotificationService Token: %@", [NSString stringWithUTF8String:deviceToken.bytes]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // This method is called when the device failed to register with the Apply Push Service
    NSLog(@"PushNotificationService Error: %@", error.localizedDescription);
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Handler for the push notifications that we receive in our application
    NSLog(@"PushNotificationService Received: %@", userInfo);
}

@end
