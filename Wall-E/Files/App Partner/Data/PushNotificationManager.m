//
//  PushNotificationManager.m
//  Template
//
//  Created by Vladyslav Gusakov on 6/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "PushNotificationManager.h"
@import UserNotifications;

#define kBHAppBoyDeepLinkIdentifier                 @"ab_uri"
#define kBHRemoteNotifApsKey                        @"aps"
#define kBHRemoteNotifAlertKey                      @"alert"
#define kBHRemoteNotifCategoryKey                   @"category"

@interface PushNotificationManager() <UNUserNotificationCenterDelegate>

@end

@implementation PushNotificationManager

+ (PushNotificationManager*)shared
{
    static PushNotificationManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[PushNotificationManager alloc] init];
    });
    return sharedManager;
}

+ (BOOL)pushNotificationsEnabled
{
    return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications] && ([[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone);
}

- (void)registerNotifications
{
    if ([SystemVersion greaterThanOrEqual:10])
    {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions: (UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge)
        completionHandler:^(BOOL granted, NSError * _Nullable error)
        {
            NSLog(@"Permission granted.");
        }];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else if ([SystemVersion greaterThan:7.1])
    {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound) categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
}

- (void)configureWithLaunchOptions:(NSDictionary*)launchOptions inApplication:(UIApplication *)application
{
    [self registerNotifications];
    
    // We need to see if we have launch options in this case as well to open if the app is killed
    if (launchOptions)
    {
        NSDictionary *remoteNotif = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        if (remoteNotif && remoteNotif[kBHRemoteNotifApsKey])
        {
            [self handleAppOpenFromPushNotification:remoteNotif];
        }
        else
        {
            UILocalNotification *localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
            if (localNotif && localNotif.userInfo != nil)
            {
                [self handleAppOpenFromLocalPushNotification:localNotif.userInfo];
            }
        }
    }
    
    // Clear the app badge that might have got updated by push
    [application setApplicationIconBadgeNumber:0];
}

- (void)handleDidRegisterForPushWithDeviceToken:(NSData*)deviceToken
{
}

- (void)handleAppTerminate
{
    // Shutdown any push notification service if required
}

- (void)handleAppOpenFromPushNotification:(NSDictionary *)userInfo
{
}

-(void)handleAppOpenFromLocalPushNotification:(NSDictionary *)userInfo
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)handleLocalNotificationInForeground:(NSDictionary *)userInfo
{
}

- (void)handlePushNotificationReceptionInOpenApp:(NSDictionary *)userInfo
{
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)(void))completionHandler
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    completionHandler();
}

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)(void))completionHandler
{
    NSDictionary *userInfo = notification.userInfo;
    
    if ([userInfo objectForKey:kBHRemoteNotifApsKey])
    {
        // This means the local notif is a snoozed remote notif
        [self handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
    }
    else
    {
        completionHandler();
    }
}

#pragma mark - Private Methods

# pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    //handle push while app is in the foreground
    [GCD on:GCDQueueTypeMain perform:^{
        [self handleLocalNotificationInForeground:notification.request.content.userInfo];
    }];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler
{
    [GCD on:GCDQueueTypeMain perform:^{
        [self handleAppOpenFromLocalPushNotification:response.notification.request.content.userInfo];
    }];
}

@end
