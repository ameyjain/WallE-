//
//  MainModel.m
//  Template
//
//  Created by Vladyslav Gusakov on 5/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "MainModel.h"

@interface MainModel()
@end

@implementation MainModel

- (void)getIPText:(StringCompletionBlock)completion
{
    [NetworkingClient requestWithMethod:RequestMethodGET urlString:@"https://httpbin.org/ip" parameters:@{} withSuccess:^(NSDictionary<NSString *,id> * _Nonnull dictionary)
     {
         if ([dictionary[@"origin"] isKindOfClass:[NSString class]])
         {
             NSString *ip = dictionary[@"origin"];
             
             if (ip.length > 0)
             {
                 completion([NSString stringWithFormat:@"Your IP is: %@", ip]);
                 return;
             }
         }
         completion(@"Failed to fetch your IP");
         
     } withError:^(NSError * _Nonnull error)
     {
         completion(@"Failed to fetch your IP");
     }];
}

@end
