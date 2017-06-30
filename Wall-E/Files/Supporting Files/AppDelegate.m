//
//  AppDelegate.m
//  Template_iOS
//
//  Created by App Partner on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Window and Nav Bar
    [self createWindow];
    [self customizeNavAppearances];
    
    [[UserManager shared] loadLocalUser];
    
    // Services
    [[ServiceManager shared] enableWithService:ServiceHockeyApp];
    [[ServiceManager shared] enableWithService:ServiceGoogleAnalytics];
    [[ServiceManager shared] enableWithService:ServiceDebugManager];
    
    [[ServiceManager shared] enableWithService:ServiceNotifications completion:^{
        [[PushNotificationManager shared] configureWithLaunchOptions:launchOptions inApplication:application];
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [DebugManager displayDebug];
    
    //General info
    [[GeneralInfoManager shared] fetchGeneralInfo];
}

- (void)applicationWillTerminate:(UIApplication *)application { }

#pragma mark - Push Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[PushNotificationManager shared] handleDidRegisterForPushWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    switch (application.applicationState)
    {
        case UIApplicationStateActive:
            [[PushNotificationManager shared] handlePushNotificationReceptionInOpenApp:userInfo];
            break;
            
        case UIApplicationStateInactive:
        case UIApplicationStateBackground:
            [[PushNotificationManager shared] handleAppOpenFromPushNotification:userInfo];
            break;
    }
}

/**
 WARNING!! Does not get called in iOS 10!
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    switch (application.applicationState)
    {
        case UIApplicationStateActive:
            [[PushNotificationManager shared] handleLocalNotificationInForeground:notification.userInfo];
            break;
            
        case UIApplicationStateInactive:
        case UIApplicationStateBackground:
            [[PushNotificationManager shared] handleAppOpenFromLocalPushNotification:notification.userInfo];
            break;
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler
{
    [[PushNotificationManager shared] handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler
{
    [[PushNotificationManager shared] handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
}

#pragma mark - Window Creation

- (void)createWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [CoreTabBarViewController instance];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
}

- (void)customizeNavAppearances
{
    // Nav bar
    UIColor *navTint = [UIColor whiteColor];
    [UINavigationBar appearance].tintColor = navTint;
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:navTint,
                                                         NSFontAttributeName: [UIFont helveticaNeueMedium17Font]};
    [UINavigationBar appearance].barTintColor = [UIColor mainColor];
    [[UINavigationBar appearance] setTranslucent:NO];
}

@end
