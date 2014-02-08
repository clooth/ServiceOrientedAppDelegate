//
//  AppDelegate.m
//  ServiceOrientedAppDelegate
//
//  Created by Nico Hämäläinen on 09/02/14.
//  Copyright (c) 2014 Nico Hämäläinen. All rights reserved.
//

#import "AppDelegate.h"
#import "PushNotificationService.h"

@implementation AppDelegate

// The services are only initialized once, via their singleton accessors
- (NSArray *)services {
    static NSArray * _services;
    static dispatch_once_t _onceTokenServices;
    dispatch_once(&_onceTokenServices, ^{
        _services = @[[PushNotificationService sharedInstance]];
    });
    return _services;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [super application:application didFinishLaunchingWithOptions:launchOptions];

    return YES;
}

@end
