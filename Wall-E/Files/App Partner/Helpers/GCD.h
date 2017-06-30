//
//  Functions.h
//  Template
//
//  Created by Vladyslav Gusakov on 6/6/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>

//Documentation can be found here: https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html

typedef NS_ENUM(NSUInteger, GCDQueueType)
{
    GCDQueueTypeMain,
    GCDQueueTypeUserInteractive, // Work that is interacting with the user, such as operating on the main thread, refreshing the user interface, or performing animations
    GCDQueueTypeUserInitiated, // Work that the user has initiated and requires immediate results, such as opening a saved document or performing an action when the user clicks something in the user interface
    GCDQueueTypeUtility, // Work that may take some time to complete and doesn’t require an immediate result, such as downloading or importing data
    GCDQueueTypeBackground // Work that operates in the background and isn’t visible to the user, such as indexing, synchronizing, and backups.
};


@interface GCD : NSObject
 
+ (void)on:(GCDQueueType)queue perform:(NoArgsCompletionBlock)block;
+ (void)on:(GCDQueueType)queue after:(NSTimeInterval)delay perform:(NoArgsCompletionBlock)block;
@end
