//
//  DebugManager.m
//  Template
//
//  Created by Mike Lepore on 6/19/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "DebugManager.h"

#if DEBUG
#import "FLEXManager.h"
#endif

@implementation DebugManager

+ (void)displayDebug
{
    #if DEBUG
    if ([DebugManager isDebugAllowed])
    {
        [[FLEXManager sharedManager] showExplorer];
    }
    #endif
}

+ (BOOL)isDebugAllowed
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"app_debugger"] && [defaults boolForKey:@"app_debugger"];
}
@end
