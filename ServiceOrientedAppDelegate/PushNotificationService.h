//
//  PushNotificationService.h
//  ServiceOrientedAppDelegate
//
//  Created by Nico Hämäläinen on 09/02/14.
//  Copyright (c) 2014 Nico Hämäläinen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushNotificationService : NSObject <UIApplicationDelegate>

+ (instancetype)sharedInstance;

@end
