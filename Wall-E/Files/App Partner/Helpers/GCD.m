//
//  Functions.m
//  Template
//
//  Created by Vladyslav Gusakov on 6/6/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "GCD.h"

@implementation GCD

+ (void)on:(GCDQueueType)queue perform:(NoArgsCompletionBlock)block
{
    [GCD on:queue after:0 perform:block];
}

+ (void)on:(GCDQueueType)queue after:(NSTimeInterval)delay perform:(NoArgsCompletionBlock)block
{
    dispatch_queue_t queueType = [GCD queueTypeFrom:queue];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), queueType,
       block);
}

+ (dispatch_queue_t)queueTypeFrom:(GCDQueueType)type
{
    switch (type)
    {
        case GCDQueueTypeMain:
            return dispatch_get_main_queue();
        case GCDQueueTypeUserInteractive:
            return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
        case GCDQueueTypeUserInitiated:
            return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
        case GCDQueueTypeUtility:
            return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        case GCDQueueTypeBackground:
            return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    }
}

@end
