//
//  SOAppDelegate.h
//  ServiceOrientedAppDelegate
//
//  Created by Nico Hämäläinen on 09/02/14.
//  Copyright (c) 2014 Nico Hämäläinen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOAppDelegate : UIResponder <UIApplicationDelegate>

// The list of services that will be integrated into our application lifecycle
- (NSArray *)services;

// Main window reference
@property (strong, nonatomic) UIWindow *window;

@end
