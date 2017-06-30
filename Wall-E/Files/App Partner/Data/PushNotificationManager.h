//
//  PushNotificationManager.h
//  Template
//
//  Created by Vladyslav Gusakov on 6/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

@import Foundation;

@interface PushNotificationManager : NSObject

+ (PushNotificationManager*)shared;

+ (BOOL)pushNotificationsEnabled;

- (void)configureWithLaunchOptions:(NSDictionary*)launchOptions inApplication:(UIApplication *)application;
- (void)handleDidRegisterForPushWithDeviceToken:(NSData*)deviceToken;
- (void)handleAppOpenFromPushNotification:(NSDictionary *)userInfo;
- (void)handleAppOpenFromLocalPushNotification:(NSDictionary *)userInfo;
- (void)handlePushNotificationReceptionInOpenApp:(NSDictionary *)userInfo;
- (void)handleLocalNotificationInForeground:(NSDictionary *)userInfo;
- (void)handleAppTerminate;
- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)(void))completionHandler;
- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)(void))completionHandler;
@end
